class NewsCrawler
  def self.parse_url(url)
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)

    posts_container = parsed_page.css('ul#posts-list li.post')

    posts_container.each do |post|
      item = {}

      item[:title] = post.css('h2 a').text
      item[:subtitle] = post.css('p').text
      item[:url] = post.css('h2 a').map { |link| link['href'] }[0]
      item[:publishing_date] = parse_date(post.css('.details').text)
      item[:crawl_date] = Time.now
      item[:news_body] = parse_child_page(item[:url])

      new_piece = News.where(item).first_or_create
    end
  end

  def self.parse_child_page(child_page)
    puts "parsing: #{child_page}"
    text_body = ""
    unparsed_page = HTTParty.get(child_page)
    parsed_page = Nokogiri::HTML(unparsed_page)

    paragraphs = parsed_page.css('.entry-content p')

    paragraphs.each do |paragraph|
      text_body += paragraph.text
    end

    text_body
  end

  def self.parse_date(str)
    str.match(/\d{2}\/\d{2}\/\d{4}.\d{2}h\d{2}/).to_s.to_datetime
  end

  def self.parse_website(url)
    unparsed_url = HTTParty.get(url)
    parsed_url = Nokogiri::HTML(unparsed_url)
    last_page = parsed_url.css('.last a').map { |link| link['href'] }[0].match(/\d+/).to_s.to_i

    for i in 1..last_page
      parse_url("#{url}/page/#{i}")
    end
  end
end

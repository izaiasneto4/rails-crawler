class NewsCrawler
  def self.parse_url(url)
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)

    posts_container = parsed_page.css('ul#posts-list li')

    posts_container.each do |post|
      item = {}

      item[:title] = post.css('.col-9 h2 a').text
      item[:subtitle] = post.css('.col-9 p').text
      item[:url] = post.css('.col-9 h2 a').map { |link| link['href'] }[0]
      item[:publishing_date] = parse_date(post.css('.details').text)
      item[:crawl_date] = Time.now
      item[:news_body] = parse_child_page(item[:url])

      News.where(item).first_or_create
      return "okay"
    end
  end

  def self.parse_child_page(child_page)
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
    continue = true
    unparsed_website = HTTParty.get(url)
    parsed_website = Nokogiri::HTML(unparsed_website)
    last_page = parsed_website.css('.last a.page-link').map { |link| link['href'] }[0].match(/\d/).join.to_i
    current = 1
    while continue

      
      if current >= last_page
        continue = false
      end

      current += 1
    end
  end
end

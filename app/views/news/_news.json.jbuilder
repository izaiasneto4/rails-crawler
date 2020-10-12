json.extract! news, :id, :url, :title, :subtitle, :publishing_date, :crawl_date, :news_body, :tags, :created_at, :updated_at
json.url news_url(news, format: :json)

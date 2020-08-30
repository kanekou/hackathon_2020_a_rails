require "net/http"
require "uri"
require "json"

class CollectArticleWorker
  include Sidekiq::Worker

  def perform(*_args)
    articles = fetch_articles

    count = 0
    articles.each do |params|
      next if Article.find_by(url: params["url"])

      params["topic"] = Topic.find_by(code: params["topic"])
      Article.create(params)
      count += 1
      puts "create new article: #{params["url"]}"
    end

    if count > 0
      puts "create #{count} articles"
    else
      puts "no articles are created"
    end
  end

  private

  def fetch_articles
    print "fetch articles from flask server...... "
    url = ENV["FLASK_URL"] + "/get_news"
    res = Net::HTTP.get(URI.parse(url))
    articles = JSON.parse(res)["articles"]
    puts "success"
    articles
  rescue => e
    puts "failed"
    puts e
    []
  end
end

class Article < ApplicationRecord
  belongs_to :topic
  has_many :user_article_insights
  has_many :user_recommended_news_history_articles
end

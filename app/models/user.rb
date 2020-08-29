class User < ApplicationRecord
  has_many :adresses
  has_many :user_topic_insights
  has_many :user_recommended_news_histories
  has_many :user_articles_insights
end

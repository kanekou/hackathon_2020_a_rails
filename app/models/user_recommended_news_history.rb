class UserRecommendedNewsHistory < ApplicationRecord
  belongs_to :user
  has_many :user_recommended_news_history_articles
  has_many :articles, through: :user_recommended_news_history_articles
end

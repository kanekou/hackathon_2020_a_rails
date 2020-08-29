class User < ApplicationRecord
  has_many :addresses
  has_many :user_topic_insights
  has_many :topics, through: :user_topic_insights
  has_many :user_recommended_news_histories
  has_many :user_articles_insights
  validates :nickname, presence: true
  validates :mail, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :nickname, presence: true
  has_secure_password
end

class User < ApplicationRecord
  has_secure_password

  has_many :addresses
  has_many :user_topic_insights
  has_many :topics, through: :user_topic_insights
  has_many :user_recommended_news_histories
  has_many :user_articles_insights

  validates :nickname, presence: true
  validates :mail, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :nickname, presence: true

  before_save :set_api_key

  private

  def set_api_key
    api_key = SecureRandom.base64(32)
    loop { api_key = SecureRandom.base64(32) if User.find_by(api_key: api_key) }
    self.api_key = api_key
  end
end

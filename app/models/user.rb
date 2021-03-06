class User < ApplicationRecord
  has_secure_password

  has_many :addresses
  has_many :user_topic_insigtht
  has_many :topics, through: :user_topic_insights
  has_many :user_recommended_news_histories
  has_many :user_articles_insights

  validates :email, presence: true, uniqueness: true

  before_save :set_api_key
  after_create :create_user_topic_insights

  private

  def set_api_key
    api_key = SecureRandom.base64(32)[0, 32]
    api_key = SecureRandom.base64(32)[0, 32] while User.find_by(api_key: api_key)
    self.api_key = api_key
  end

  def create_user_topic_insights
    Topic.all.each do |topic|
      user_topic_insigtht.create(topic: topic, views: 0)
    end
  end
end

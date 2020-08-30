class Article < ApplicationRecord
  belongs_to :topic
  has_many :user_article_insights
  has_many :user_recommended_news_history_articles

  validates :url, presence: true, uniqueness: true
  validates :title, presence: true
  validates :summary, presence: true
  validates :written_at, presence: true
end

class Topic < ApplicationRecord
  has_many :user_topic_insights
  has_many :users, through: :user_topic_insights
  validates :name, presence: true, uniqueness: true
  validates :default_delivery_time, presence: true
end

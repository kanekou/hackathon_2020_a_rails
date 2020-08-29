class Topic < ApplicationRecord
  has_many :topics
  validates :name, presence: true, uniqueness: true
  validates :default_delivery_time, presence: true
end

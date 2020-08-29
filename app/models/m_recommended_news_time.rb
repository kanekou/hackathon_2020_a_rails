class MRecommendedNewsTime < ApplicationRecord
  validates :recommend_time, presence: true
  validates :period, presence: true

  enum period: { morning: 1, daytime: 2, night: 3 }
end

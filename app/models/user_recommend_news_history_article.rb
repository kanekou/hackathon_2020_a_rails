class UserRecommendNewsHistoryArticle < ApplicationRecord
  belongs_to :user_recommended_news_histor
  belongs_to :article
end

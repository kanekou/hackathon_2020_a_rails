class UserRecommendedNewsHistoryArticle < ApplicationRecord
  belongs_to :user_recommended_news_history
  belongs_to :article
end

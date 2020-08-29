class CreateUserRecommendNewsHistoryArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_recommend_news_history_articles do |t|
      t.references :user_recommended_news_history, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end

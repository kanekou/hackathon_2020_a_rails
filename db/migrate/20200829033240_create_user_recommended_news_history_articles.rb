class CreateUserRecommendedNewsHistoryArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_recommended_news_history_articles do |t|
      t.references :user_recommended_news_history, index: { name: 'user_recommended_news_history_id' },
                   null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end

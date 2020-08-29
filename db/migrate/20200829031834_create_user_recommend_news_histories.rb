class CreateUserRecommendNewsHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :user_recommend_news_histories do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

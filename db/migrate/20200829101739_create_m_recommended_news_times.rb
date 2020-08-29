class CreateMRecommendedNewsTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :m_recommended_news_times do |t|
      t.time :recommend_time, null: false
      t.integer :period, null: false

      t.timestamps
    end
  end
end

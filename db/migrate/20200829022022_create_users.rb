class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :nickname
      t.string :password_digest
      t.datetime :everyday_news_delivery_time
      t.datetime :heat_stroke_news_delivery_time
      t.string :api_key

      t.timestamps
    end
  end
end

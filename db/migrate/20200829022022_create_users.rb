class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :nickname, null: false
      t.string :password_digest, null: false
      t.datetime :everyday_news_delivery_time
      t.datetime :heat_stroke_news_delivery_time
      t.string :api_key

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end

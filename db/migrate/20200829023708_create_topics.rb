class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :name, null: false
      t.datetime :default_delivery_time, null: false

      t.timestamps
    end
    add_index :topics, :name, unique: true
  end
end

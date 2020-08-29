class CreateUserTopicInsigthts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_topic_insigthts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true
      t.integer :views

      t.timestamps
    end
  end
end

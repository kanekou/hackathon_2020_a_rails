class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :topic, null: false, foreign_key: true
      t.string :title
      t.string :summary
      t.string :url

      t.timestamps
    end
  end
end

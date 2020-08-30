class AddWrittenAtToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :written_at, :datetime, null: false
  end
end

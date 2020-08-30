class AddCodeToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :code, :string, null: false, default: ""
  end
end

class AddUrlToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :url, :string
  end
end

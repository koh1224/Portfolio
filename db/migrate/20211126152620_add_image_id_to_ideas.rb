class AddImageIdToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :image_id, :string
  end
end

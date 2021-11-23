class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.integer :genre_id
      t.integer :user_id
      t.string :idea
      t.text :body

      t.timestamps
    end
  end
end

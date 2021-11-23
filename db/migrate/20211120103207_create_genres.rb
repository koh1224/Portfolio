class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :form
      t.string :texture
      t.string :color
      t.string :material
      t.timestamps
    end
  end
end

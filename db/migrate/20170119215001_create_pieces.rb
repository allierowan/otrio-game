class CreatePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces do |t|
      t.integer :size
      t.string :color
      t.integer :x_pos
      t.integer :y_pos

      t.timestamps
    end
  end
end

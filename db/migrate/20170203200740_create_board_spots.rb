class CreateBoardSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :board_spots do |t|
      t.integer :game_board_id
      t.integer :x_pos
      t.integer :y_pos
      t.boolean :played
      t.integer :played_piece_id
      t.string :size

      t.timestamps
    end
  end
end

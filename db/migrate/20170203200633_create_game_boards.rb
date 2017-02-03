class CreateGameBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :game_boards do |t|
      t.integer :game_id

      t.timestamps
    end
  end
end

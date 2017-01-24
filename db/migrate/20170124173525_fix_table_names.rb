class FixTableNames < ActiveRecord::Migration[5.0]
  def change
    rename_table :piece, :pieces
    rename_table :game, :games
    rename_table :player, :players
  end
end

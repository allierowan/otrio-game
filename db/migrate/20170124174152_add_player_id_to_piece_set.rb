class AddPlayerIdToPieceSet < ActiveRecord::Migration[5.0]
  def change
    add_column :piece_sets, :player_id, :integer
  end
end

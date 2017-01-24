class AddIntegerPieceSetIdToPiece < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :piece_set_id, :integer
  end
end

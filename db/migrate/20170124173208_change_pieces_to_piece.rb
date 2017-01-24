class ChangePiecesToPiece < ActiveRecord::Migration[5.0]
  def change
    rename_table :pieces, :piece
  end
end

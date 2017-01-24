class AddColorStringToPieceSets < ActiveRecord::Migration[5.0]
  def change
    add_column :piece_sets, :color, :string
  end
end

class CreatePieceSets < ActiveRecord::Migration[5.0]
  def change
    create_table :piece_sets do |t|

      t.timestamps
    end
  end
end

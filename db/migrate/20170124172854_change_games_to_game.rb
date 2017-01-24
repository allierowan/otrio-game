class ChangeGamesToGame < ActiveRecord::Migration[5.0]
  def change
    rename_table :games, :game
  end
end

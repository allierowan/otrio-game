class AddIntegerPlayerTurnIdToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :player_turn_id, :integer
  end
end

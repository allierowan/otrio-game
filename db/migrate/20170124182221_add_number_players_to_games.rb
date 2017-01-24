class AddNumberPlayersToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :number_players, :integer
  end
end

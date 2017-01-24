class ChangePlayersToPlayer < ActiveRecord::Migration[5.0]
  def change
    rename_table :players, :player
  end
end

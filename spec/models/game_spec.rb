require "spec_helper"

RSpec.describe Game do
  describe "initialize" do

    it "creates the right number of players and their piece sets" do
      my_game = Game.create(number_players: 2)
      expect(my_game.players.size).to eq(2)
      expect(my_game.players.first.color).to eq("purple")
      expect(my_game.players.last.color).to eq("green")
      expect(my_game.players.first.pieces.size).to eq(9)
    end

  end

  describe "game's players" do
    it "can access its player of a certain color" do
      my_game = Game.create(number_players: 2)
      expect(my_game.player_with("purple").color).to eq("purple")
      expect(my_game.player_with("green").color).to eq("green")
    end
  end

  describe "update_turn" do
    it "updates which player's turn it is" do
      my_game = Game.create(number_players: 2)
      expect(my_game.player_turn.color).to eq("purple")
      my_game.update_turn
      expect(my_game.player_turn.color).to eq("green")
      my_game = Game.create(number_players: 3)
      expect(my_game.player_turn.color).to eq("purple")
      my_game.update_turn
      my_game.update_turn
      expect(my_game.player_turn.color).to eq("blue")
      my_game.update_turn
      expect(my_game.player_turn.color).to eq("purple")
    end
  end
end

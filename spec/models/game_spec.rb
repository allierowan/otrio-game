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
end

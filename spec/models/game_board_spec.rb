require "spec_helper"

RSpec.describe GameBoard do
  describe "initialize" do

    it "creates the right number of board_spots" do
      my_game = Game.create(number_players: 2)
      expect(my_game.board_spots.size).to eq(27)
    end

  end
end

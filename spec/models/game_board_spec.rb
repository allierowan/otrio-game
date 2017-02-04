require "spec_helper"

RSpec.describe GameBoard do
  describe "initialize" do

    it "creates the right number of board_spots" do
      my_game = Game.create(number_players: 2)
      expect(my_game.board_spots.size).to eq(27)
    end

  end

  describe "game board" do
    it "can retrieve all spots at a certain position" do
      my_game = Game.create(number_players: 2)
      board = my_game.game_board
      bottom_left_spots = board.spots_at(1, 1)
      expect(bottom_left_spots.size).to eq(3)
      sizes = bottom_left_spots.map { |spot| spot.size }
      expect(sizes).to match_array(["sm", "md", "lg"])
      expect(bottom_left_spots.first.x_pos).to eq(1)
      expect(bottom_left_spots.first.y_pos).to eq(1)
    end
  end
end

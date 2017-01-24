require "spec_helper"

RSpec.describe PieceSet do
  describe "initialize" do

    it "creates the right number of pieces with the right sizes and color" do
      my_piece_set = PieceSet.create(color: "blue")
      expect(my_piece_set.pieces.size).to eq(9)
      expect(my_piece_set.pieces.first.color).to eq("blue")
      expect(my_piece_set.pieces.map(&:size).uniq).to match_array([1, 2, 3])
    end

  end
end

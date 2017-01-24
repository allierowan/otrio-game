require 'test_helper'

class PieceSetTest < ActiveSupport::TestCase

  test "when initialized, set has correct pieces associated" do
    my_piece_set = PieceSet.create(color: "blue")
    assert_equal 9, my_piece_set.pieces.size
    assert_equal "blue", my_piece_set.pieces.first.color
    assert_equal [1, 2, 3], my_piece_set.pieces.map(&:size).uniq
  end
end

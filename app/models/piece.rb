class Piece < ApplicationRecord
  belongs_to :piece_set

  COLORS = ["red", "blue", "green", "purple"]
  SIZES = [1, 2, 3]

end

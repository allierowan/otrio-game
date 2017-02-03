class Piece < ApplicationRecord
  belongs_to :piece_set

  COLORS = ["red", "blue", "green", "purple"]
  SIZES = [1, 2, 3]

  def played
    x_pos || y_pos
  end

  def play(x_pos, y_pos)
    self.x_pos = x_pos
    self.y_pos = y_pos
    self.save
  end

end

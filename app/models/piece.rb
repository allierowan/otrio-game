class Piece < ApplicationRecord
  belongs_to :piece_set
  has_one :board_spot
  
  COLORS = ["red", "blue", "green", "purple"]
  SIZES = [1, 2, 3]

  def played?
    x_pos && y_pos
  end

  def play(x_pos, y_pos)
    self.update(x_pos: x_pos)
    self.update(y_pos: y_pos)
  end

end

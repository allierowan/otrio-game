class Piece < ApplicationRecord
  belongs_to :piece_set
  has_one :board_spot, foreign_key: "played_piece_id"

  COLORS = ["red", "blue", "green", "purple"]
  SIZES = [1, 2, 3]

  def played?
    x_pos && y_pos
  end

  def play(x_pos, y_pos)
    size_translate = { 1 => "sm", 2 => "md", 3 => "lg" }
    self.update(x_pos: x_pos)
    self.update(y_pos: y_pos)
    position = game.board_spots.select {|spot| spot.x_pos == x_pos.to_i && spot.y_pos == y_pos.to_i && spot.size == size_translate[self.size] }.first
    self.update!(board_spot: position)
  end

  def game
    piece_set.player.game
  end

end

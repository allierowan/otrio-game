class BoardSpot < ApplicationRecord
  belongs_to :game_board
  belongs_to :played_piece, class_name: "Piece", foreign_key: "played_piece_id", optional: true

  def css_class_list
    size_class = size + "-space"
    x_pos_class = "x-" + x_pos.to_s
    y_pos_class = "y-" + y_pos.to_s
    color_class = (played_piece.color + "-color") if played_piece

    ("board-space " + size_class + " " + x_pos_class + " " + y_pos_class + " " + color_class.to_s).strip
  end
end

class GameBoard < ApplicationRecord
  belongs_to :game
  has_many :board_spots
  after_create :init_board

  SIZES = ["sm", "md", "lg"]

  def init_board
    [1, 2, 3].each do |y|
      [1, 2, 3].each do |x|
        SIZES.each do |size|
          board_spots << BoardSpot.create(x_pos: x, y_pos: y, size: size, played: false)
        end
      end
    end
  end

end

class GameBoard < ApplicationRecord
  belongs_to :game
  has_many :board_spots
  after_create :init_board

  SIZES = ["lg", "md", "sm"]

  def init_board
    [1, 2, 3].each do |y|
      [1, 2, 3].each do |x|
        SIZES.each do |size|
          board_spots << BoardSpot.create(x_pos: x, y_pos: y, size: size, played: false)
        end
      end
    end
  end

  def row_one_spots
    board_spots.select { |spot| spot.y_pos == 1 }
  end

  def row_two_spots
    board_spots.select { |spot| spot.y_pos == 2 }
  end

  def row_three_spots
    board_spots.select { |spot| spot.y_pos == 3 }
  end

  def spots_at(x, y)
    board_spots.select { |spot| spot.x_pos == x && spot.y_pos == y }.sort_by{ |spot| spot.size }
  end

end

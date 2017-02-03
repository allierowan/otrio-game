class BoardSpot < ApplicationRecord
  belongs_to :game_board
  belongs_to :piece, optional: true
end

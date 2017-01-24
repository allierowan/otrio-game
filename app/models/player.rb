class Player < ApplicationRecord
  belongs_to :game, optional: true
  has_one :game, foreign_key: :player_turn_id
  has_one :piece_set
  has_many :pieces, through: :piece_set
end

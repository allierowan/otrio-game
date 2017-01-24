class Game < ApplicationRecord
  has_many :players
  belongs_to :player_turn, class_name: "Player", foreign_key: :player_turn_id, optional: true
  after_create :init_players

  NUM_PLAYERS = [2, 3, 4]

  def init_players
    possible_colors = Piece::COLORS
    self.number_players.times do
      player_color = possible_colors.pop
      player = Player.new(color: player_color)
      player.piece_set = PieceSet.new(color: player_color)
      player.save!
      self.players << player
    end
    self.player_turn = self.players.first
    self.save
  end

end

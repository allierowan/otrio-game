class Game < ApplicationRecord
  has_many :players
  belongs_to :player_turn, class_name: "Player", foreign_key: :player_turn_id, optional: true
  after_create :init_players
  has_many :pieces, through: :players

  NUM_PLAYERS = [2, 3, 4]

  def init_players
    possible_colors = Piece::COLORS.dup
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

  def unplayed_pieces
    pieces.select { |piece| !piece.played }
  end

  def select_unplayed_piece(piece_color, piece_size)
    unplayed_pieces.select {|piece| piece.color == piece_color && piece.size == piece_size}.sample
  end

  def update_turn
    index = players.index(player_turn)
    self.update(player_turn_id: index + 1)
  end

end

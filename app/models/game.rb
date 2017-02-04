class Game < ApplicationRecord
  has_many :players
  belongs_to :player_turn, class_name: "Player", foreign_key: :player_turn_id, optional: true
  after_create :init_players
  after_create :init_board
  has_many :pieces, through: :players
  has_one :game_board
  has_many :board_spots, through: :game_board

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

  def init_board
    update(game_board: GameBoard.create())
  end

  def unplayed_pieces
    pieces.select { |piece| !piece.played? }
  end

  def select_unplayed_piece(piece_color, piece_size)
    unplayed_pieces.select {|piece| piece.color == piece_color && piece.size == piece_size}.sample
  end

  def game_turn_order
    players.map { |player| player.color }
  end

  def player_with(color)
    players.select { |player| player.color == color }.first
  end

  def update_turn
    turn_order = self.game_turn_order
    index = turn_order.index(player_turn.color)
    if index == turn_order.size - 1
      update(player_turn: player_with(turn_order[0]))
    else
      update(player_turn: player_with(turn_order[index + 1]))
    end
  end

  def non_turn_players
    players.select { |player| player != player_turn }
  end

end

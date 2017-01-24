class PieceSet < ApplicationRecord
  has_many :pieces
  belongs_to :player, optional: true
  after_create :init_pieces

  def init_pieces
    3.times do
      Piece::SIZES.each do |size|
        self.pieces.build(color: self.color, size: size)
      end
    end
    self.save
  end
end

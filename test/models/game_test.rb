require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "when a game is initalized, players and piece sets are created" do
    game = Game.create!(number_players: 2)
    assert_equal 2, game.players.size
    assert_equal "purple", game.players.first.color
    assert_equal "green", game.players.last.color
    assert_equal 9, game.players.first.pieces.size
  end
end

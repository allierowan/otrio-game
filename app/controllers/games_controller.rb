class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    render :show
  end

  private
  def game_params
    params.require(:game).permit(:number_players)
  end
end

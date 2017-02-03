class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(@game.id)
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    piece = @game.select_unplayed_piece(piece_move_params[:color], piece_move_params[:size])
    piece.play(piece_move_params[:x_pos], piece_move_params[:y_pos])
    @game.update_turn
    @game.save
    redirect_to game_path(@game.id)
  end

  private
  def game_params
    params.require(:game).permit(:number_players)
  end

  def piece_move_params
    params.require(:move).permit(:color, :x_pos, :y_pos, :size)
  end
end

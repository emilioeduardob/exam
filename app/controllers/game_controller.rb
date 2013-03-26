class GameController < ApplicationController
  def index
    @game = Game.find_or_create_by_session_id(request.session_options[:id])
  end

  def play
    @game = Game.find_by_session_id(request.session_options[:id])
    @game.play(params[:new_mark])
    render json: @game.status
  end
end

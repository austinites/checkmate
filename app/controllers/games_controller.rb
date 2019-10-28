class GamesController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :show]
  def show
    @game = Game.find(params[:id])
  end

  def new
  	@game=current_user.games.create(white_id: current_user.id, turn_number: 1)
  	@game.initialize_board
  	redirect_to :action => "show", :id => @game.id
  end

  def update
  	@game = Game.find(params[:id])
  	@game.update_attributes(black_id: current_user.id)
  	redirect_to :action => "show", :id => @game.id
  end

end

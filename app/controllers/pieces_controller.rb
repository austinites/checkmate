class PiecesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :show]

	def show
		@piece=Piece.find(params[:id])
		@game=Game.find(@piece.game_id)
    end

    def update
    	@piece=Piece.find(params[:id])
		@game=Game.find(@piece.game_id)
    	@piece.update_attributes(xcoordinate: params[:piece][:xmove].to_i, ycoordinate: params[:piece][:ymove].to_i )
    	redirect_to :controller => "games", :action => "show", :id => @game.id
    end
end

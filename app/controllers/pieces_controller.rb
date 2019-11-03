class PiecesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :show]

	def show
		@piece=Piece.find(params[:id])
		@game=Game.find(@piece.game_id)
    end

    def update
    	@piece.update_attributes( )
    end
end

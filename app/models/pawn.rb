class Pawn < Piece
  def legal_move?#(x, y)
  	puts("Pawn Legal Move")
  end

  #when pawn reaches the end of the board
  def promotion

  end  

  def code
  	if self.color == "white"
  		return "&#x2659;"
  	end
  	if self.color == "black"
  		return "&#x265F;"
  	end
end
  
end
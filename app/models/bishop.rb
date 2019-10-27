class Bishop < Piece
  def legal_move?#(x, y)

  end

  def code
  	if self.color == "white"
  		return "&#x2657;"
  	end
  	if self.color == "black"
  		return "&#x265D;"
  	end
  end

end
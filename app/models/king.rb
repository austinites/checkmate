class King < Piece
  def legal_move?#(x, y)

  end

  def code
  	if self.color == "white"
  		return "&#x2654;"
  	end
  	if self.color == "black"
  		return "&#x265A;"
  	end
  end
end
class Queen < Piece
  def legal_move?#(x, y)

  end
  
  def code
  	if self.color == "white"
  		return "&#x2655;"
  	end
  	if self.color == "black"
  		return "&#x265B;"
  	end
  end
end
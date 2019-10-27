class Knight < Piece
  def legal_move?#(x, y)

  end

  def code
  	if self.color == "white"
  		return "&#x2658;"
  	end
  	if self.color == "black"
  		return "&#x265E;"
  	end
  end

end
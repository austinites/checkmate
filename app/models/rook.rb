class Rook < Piece
  def legal_move?#(x, y)

  end

  def castling

  end

  def code
  	if self.color == "white"
  		return "&#x2656;"
  	end
  	if self.color == "black"
  		return "&#x265C;"
  	end
  end
end
class Pawn < Piece
  def legal_move?(x, y)
  	if self.xcoordinate == x && self.ycoordinate == 6-y
      return true
    else
      return false
    end

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
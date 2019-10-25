class Pawn < Piece

  def legal_move?#(x, y)

  end

  #determine if pawn has moved or not, check their initial xcoordinate value
  #if pawn's first move, can go forward 2 square instead of 1
  #en passant?
  def en_passant?(y)
    y_diff = (y - @ycoordinate).abs
    first_move?(y) ? (y_diff == 1 || y_diff == 2) : false
  end
  #when pawn reaches the end of the board
  def promotion

  end  

  def first_move?(y)
    (ycoordinate == 1 && "black") || (ycoordinate == 6 && "white")
  end
end
class King < Piece
  def starting_position(x, y)
    if color == black
      (4, 0)
    else
      (3, 7)
    end
  end

  def legal_move?(x, y)
    x_distance(x) <= 1 && y_distance(y) <=1
  end

  def castling?(x, y)
    #return false if moved
    if color == black && rook.starting_position == (0, 0)
      King = (2, 0)
    elsif color == black && rook.starting_position == (7, 0)
      King = (6, 0)
    elsif color == white && rook.starting_position == (0, 7)
      King = (1, 7)
    elsif color == white && rook.starting_position == (7, 7)
      King = (5, 7)
    end  
  end
end
class Rook < Piece
  def starting_position(x, y)
    if color == black
      Rook.create (0, 0)
      Rook.create (7, 0)
    else
      Rook.create (0, 7)
      Rook.create (7, 7)
    end
  end
  def legal_move?#(x, y)

  end

  def castling?(x, y)
    #return false if moved
    if color == black && rook.starting_position == (0, 0)
      Rook = (3, 0)
    elsif color == black && rook.starting_position == (7, 0)
      Rook = (5, 0)
    elsif color == white && rook.starting_position == (0, 7)
      Rook = (3, 7)
    elsif color == white && rook.starting_position == (7, 7)
      Rook = (5, 7)
    end  
  end
end
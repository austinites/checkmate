class Bishop < Piece
  def starting_position(x, y)
    if color == black
      Bishop.create (2, 0)
      Bishop.create (5, 0)
    else
      Bishop.create (2, 7)
      Bishop.create (5, 7)
    end
  end

  def legal_move?#(x, y)

  end
end
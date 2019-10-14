class Knight < Piece
  def starting_position(x, y)
    if color == black
      Knight.create (1, 0)
      Knight.create (6, 0)
    else
      Knight.create (1, 7)
      Knight.create (6, 7)
    end
  end

  def legal_move?#(x, y)

  end
end
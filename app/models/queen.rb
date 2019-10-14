class Queen < Piece
  def starting_position(x, y)
    if color == black
      Queen.create (3, 0)
    else
      Queen.create (3, 7)
    end
  end

  def legal_move?#(x, y)

  end
end
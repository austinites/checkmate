class Queen < Piece

  def legal_move?(x, y)
    super

    (xcoordinate == x || ycoordinate == y) || (x - xcoordinate.abs == y - ycoordinate.abs)
  end
end
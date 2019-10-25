class Queen < Piece

  def legal_move?(x, y)
    return false unless super
    #Use either bishop logic or rook logic for movement
    ((xcoordinate == x) || (ycoordinate == y)) || ((x - xcoordinate.abs) == (y - ycoordinate.abs))
  end
end
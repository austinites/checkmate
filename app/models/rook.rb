class Rook < Piece

  def legal_move?(x, y)
    return false unless super
    # Either X or Y value will remain the same for horizontal/vertical movement
    (@xcoordinate == x) || (@ycoordinate == y)  
  end
end
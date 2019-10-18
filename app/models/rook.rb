class Rook < Piece

  def legal_move?(x, y)
    super

    (@xcoordinate == x) || (@ycoordinate == y)  
  end
end
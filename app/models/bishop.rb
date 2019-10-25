class Bishop < Piece

  def legal_move?(x, y)
    return false unless super
    # X distance must always equal Y distance for diagonal movement
    (x - @xcoordinate).abs == (y - @ycoordinate).abs
  end
end
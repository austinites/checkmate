class Bishop < Piece

  def legal_move?(x, y)
    super

    (x - @xcoordinate).abs == (y - @ycoordinate).abs
  end
end
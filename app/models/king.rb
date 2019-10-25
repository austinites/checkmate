class King < Piece
  
  def legal_move?(x, y)
    return false unless super

    x_distance = (x - @xcoordinate).abs
    y_distance = (y - @ycoordinate).abs
    (x_distance <= 1) && (y_distance <= 1)
  end

end
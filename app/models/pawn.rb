class Pawn < Piece
  def starting_position(x, y)
    if color == black
      (0..7).each do |i|
        Pawn.create(i, 1)
      end
    else
      (0..7).each do |i|
        Pawn.create(i, 6)
      end
    end
  end

  def legal_move?#(x, y)

  end

  #when pawn reaches the end of the board
  def promotion

  end  
end
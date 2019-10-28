class Pawn < Piece

  def legal_move?(x, y)
    return false unless super

    return false if backwards_move?(y)
    return true if capture_move?(x, y)
    return false if horizontal_move?(x)

    regular_move?(y) || en_passant?(y)
  end

  #determine if pawn has moved or not, check their initial xcoordinate value
  #if pawn's first move, can go forward 2 square instead of 1
  #en passant? black must = 4 and white must = 3 for Y. If opponent first move for pawn is 2 spaces, can en passant
  def en_passant?(y)
    y_distance = (y - @ycoordinate).abs
    #condition?(y) ? (if statement is true run this code) : (if statement is false run this code)
    first_move?(y) ? (y_diff == 1 || y_diff == 2) : false  
  end
  
  #when pawn reaches the end of the board
  def promotion

  end  

  def first_move?(y)
    (ycoordinate == 1 && "black") || (ycoordinate == 6 && "white")
  end

  def backwards_move?(y)
    # if pawn = black and inputted Y value is smaller than current ycoordinate of pawn
    if (self.color == 'black' && ycoordinate > y)
      return true
    # if pawn = white and inputted Y value is bigger than current ycoordinate of pawn
    elsif (self.color == 'white' && ycoordinate < y)
      return true
    end
  end  

  def capture_move?(x, y)
    x_distance = (x - @xcoordinate).abs
    y_distance = (y - @ycoordinate).abs

    #diagonal capture, distance must = 1
    if x_distance == 1 && y_distance == 1
      return true
    end
  end

  def horizontal_move?(x)
    x_distance = (x - @xcoordinate).abs
    x_distance != 0
  end

  def regular_move?(y)
    (y - @ycoordinate).abs == 1
  end
end
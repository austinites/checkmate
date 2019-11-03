class Piece < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :user, optional: true

  # check if piece has moved since creation
  def setHasMoved?
    puts "dbg: has_moved"
    returnvalue = status.present?
    print "dbg: ", returnvalue, "\n"  
    returnvalue  
  end  


  # piece has moved, updated, and saved
  def move!
    puts "dbg: move"    
    status = "moved"
    save!
  end

  # changing x and y coordinate of piece to move it
  def move_to (x, y)
    @xcoordinate = x
    @ycoordinate = y
  end

  # check if piece is being moved off board
  def off_the_board?(x, y)
    x < 0 || y < 0 || x > 7 || y > 7 || x.nil? || y.nil?
  end


  def is_obstructed?(x, y)
    x_end = x 
    y_end = y 

    if xcoordinate < x_end && ycoordinate < y_end
      x_steps = (xcoordinate + 1).upto(x_end - 1)
      y_steps = (ycoordinate + 1).upto(y_end - 1)

      x_steps.each do |x|
        y_steps.each do |y|
          return true if piece_at?(x, y)
        end
      end
    elsif xcoordinate > x_end && ycoordinate > y_end
      x_steps = (xcoordinate - 1).downto(x_end + 1)
      y_steps = (ycoordinate - 1).downto(y_end + 1)

      x_steps.each do |x|
        y_steps.each do |y|
          return true if piece_at?(x, y)
        end
      end
    elsif xcoordinate < x_end
      (xcoordinate + 1 ).upto(x_end - 1) do |i|
        return true if piece_at?(i, y)
      end
    elsif xcoordinate > x_end
      (xcoordinate - 1).downto(x_end + 1) do |i|
        return true if piece_at?(i, y)
      end
    elsif ycoordinate < y_end
      (ycoordinate + 1).upto(y_end - 1) do |i|
        return true if piece_at?(x, i)
      end
    elsif ycoordinate > y_end
      (ycoordinate - 1).downto(y_end + 1) do |i|
        return true if piece_at?(x, i)
      end
    else
      raise "This is an exception"
    end
  
    false
  end

  def piece_at?(x, y)
    self.game.pieces.where(xcoordinate: x, ycoordinate: y).first.present?
  end

  # check if piece is still in same position
  def same_position?(x, y)
    (position_x == x && position_y == y)
  end

  # check if a piece move is valid
  def legal_move?(x, y)
    if off_the_board?(x, y) || same_position?(x, y)
      true
    else
      false
    end
  end

  #def can_be_captured?
   # opponents = game.pieces_remaining(!color)
    #opponents.each do |opponent|
     # if opponent.legal_move?(x, y)
      #  return true
      #end
    #else
    #false
  #end

  def
end

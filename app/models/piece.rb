class Piece < ApplicationRecord
  belongs_to :user, optional: true

  # check if piece has moved since creation
  def has_moved?
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

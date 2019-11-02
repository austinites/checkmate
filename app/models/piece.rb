class Piece < ApplicationRecord
 # belongs_to :user
  belongs_to :game

  def legal_move?#(x, y)
    puts "generic legal move method"
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
end

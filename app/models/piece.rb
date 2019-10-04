class Piece < ApplicationRecord
  belongs_to :user

  def legal_move?#(x, y)
    puts "generic legal move method"
  end

end

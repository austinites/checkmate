class Piece < ApplicationRecord
  belongs_to :game
  self.inheritance_column = "piece_type"

  #def legal_move?#(x, y)
    #puts "generic legal move method"
  #end

end

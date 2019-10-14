class Piece < ApplicationRecord
  belongs_to :user

  def legal_move?#(x, y)
    puts "generic legal move method"
  end

  def can_be_captured?
    opponents = game.pieces_remaining(!color)
    opponents.each do |opponent|
      if opponent.legal_move?(x, y)
        return true
      end
    else
    false
  end

end

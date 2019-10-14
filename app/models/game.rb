class Game < ApplicationRecord
  belongs_to :user

  def pieces_remaining(color)
    pieces.includes(:game)#.where(
      #"color = ? and state != 'off-board'", color).to_a
  end
end

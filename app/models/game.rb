class Game < ApplicationRecord
  belongs_to :user

  def pieces_remaining(color)
    pieces.includes(:game)#.where(
      #"color = ? and state != 'off-board'", color).to_a
  end

  def initialize_board

    # Populates black pieces in the database
    (0..7).each do |i|
      Pawn.create (color: 'black', xcoordinate: i, ycoordinate: 1)
    end
  
    Rook.create(color:'black', xcoordinate: 0, ycoordinate: 0)
    Rook.create(color:'black', xcoordinate: 7, ycoordinate: 0)
  
    Knight.create(color: 'black', xcoordinate: 1, ycoordinate: 0)
    Knight.create(color: 'black', xcoordinate: 6, ycoordinate: 0)

    Bishop.create(color: 'black', xcoordinate: 2, ycoordinate: 0)
    Bishop.create(color: 'black', xcoordinate: 5, ycoordinate: 0)

    Queen.create(color: 'black', xcoordinate: 3, ycoordinate: 0)
    King.create(color: 'black', xcoordinate: 4, ycoordinate: 0)

    # Populates black pieces in the database
    (0..7).each do |i|
      Pawn.create(color: 'white', xcoordinate: i, ycoordinate: 6)
    end
  
    Rook.create(color:'white', xcoordinate: 0, ycoordinate: 7)
    Rook.create(color:'white', xcoordinate: 7, ycoordinate: 7)

    Knight.create(color: 'white', xcoordinate: 1, ycoordinate: 7)
    Knight.create(color: 'white', xcoordinate: 6, ycoordinate: 7)

    Bishop.create(color: 'white', xcoordinate: 2, ycoordinate: 7)
    Bishop.create(color: 'white', xcoordinate: 5, ycoordinate: 7)

    Queen.create(color: 'white', xcoordinate: 3, ycoordinate: 7)
    King.create(color: 'white', xcoordinate: 4, ycoordinate: 7)
    end
  end

  def castling?(King, Rook)
    return false if status == not_moved
    # piece is black, castle to left
    if (King.color == 'black' && Rook.xcoordinate == 0)
      King.move_to(2, 0)
      Rook.move_to(3, 0) 
    elsif 
      King.move_to(6, 0)
      Rook.move_to(5, 0)
    elsif 
      King.move_to(2, 7)
      Rook.move_to(3, 7)
    elsif 
      King.move_to(6, 7)
      Rook.move_to(5, 7)
    end  
  end

end

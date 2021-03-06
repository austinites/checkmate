class Game < ApplicationRecord

  belongs_to :user
  has_many :pieces

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

    # Populates white pieces in the database
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

  # Checks if king in check
  def in_check?(king)
    opposite_pieces = pieces.where(color: !king.color)
    opposite_pieces.each do |piece|
      if piece.legal_move?(king.xcoordinate, king.ycoordinate)
        return true
      else
        return false
      end
    end
  end

  # Check if move will cause check 
  def put_in_check?(x, y)
    current_state = false
    # Create temporary game state
    ActiveRecord::Base.transaction do
      # Try to move piece to (x, y), check if king is in check 
      move_friendly_piece(x, y)
      current_state = king.where(color: king.color).in_check?
      # Rollback, remove temporary game state
      raise ActiveRecord::Rollback
    end
    reload
    current_state
  end  

  def move_friendly_piece(x, y)
    update_attributes(xcoordinate: x, ycoordinate: y)
  end

  def castling?(king, rook)
    return false if (status == has_moved)
    # piece is black, castle to left
    if (king.color == 'black' && rook.xcoordinate == 0)
      king.move_to(2, 0)
      rook.move_to(3, 0) 
    # piece is black, castle to right
    elsif (king.color == 'black' && rook.xcoordinate == 7)
      king.move_to(6, 0)
      rook.move_to(5, 0)
    # piece is white, castle to left
    elsif (king.color == 'white' && rook.xcoordinate == 0)
      king.move_to(2, 7)
      rook.move_to(3, 7)
    # piece is white, castle to right  
    elsif (king.color == 'white' && rook.xcoordinate == 7)
      king.move_to(6, 7)
      rook.move_to(5, 7)
    end  
  end
end

require "rails_helper"

RSpec.describe 'Piece' do 
  describe 'is_obstructed?' do
    it "xcoordinate move if a piece is in the way return true moving to the right" do
      game = FactoryBot.create(:game)
      piece1 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 0, ycoordinate: 0)
      piece2 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 3, ycoordinate: 0)
    
      result = piece1.is_obstructed?(6, 0)
      expect(result).to eq (true)
    end

    it "xcoordinate move if a piece is not in the way return false moving to the right" do
      game = FactoryBot.create(:game)
      piece1 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 0, ycoordinate: 0)
      piece2 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 3, ycoordinate: 0)
    
      result = piece1.is_obstructed?(2, 0)
      expect(result).to eq (false)
    end

    it "xcoordinate move if a piece is in the way return true moving to the left" do
      game = FactoryBot.create(:game)
      piece1 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 6, ycoordinate: 0)
      piece2 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 3, ycoordinate: 0)
    
      result = piece1.is_obstructed?(0, 0)
      expect(result).to eq (true)
    end

    it "xcoordinate move if a piece is not in the way return false moving to the left" do
      game = FactoryBot.create(:game)
      piece1 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 4, ycoordinate: 0)
      piece2 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 6, ycoordinate: 0)
    
      result = piece1.is_obstructed?(0, 0)
      expect(result).to eq (false)
    end

    it "ycoordinate move if a piece is in the way return true moving up" do
      game = FactoryBot.create(:game)
      piece1 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 0, ycoordinate: 0)
      piece2 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 0, ycoordinate: 3)

      result = piece1.is_obstructed?(0, 6)
      expect(result).to eq (true)
    end

    it "ycoordinate move if a piece is not in the way return false moving up" do
      game = FactoryBot.create(:game)
      piece1 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 0, ycoordinate: 0)
      piece2 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 0, ycoordinate: 3)

      result = piece1.is_obstructed?(0, 1)
      expect(result).to eq (false)
    end

    it "ycoordinate move if a piece is in the way return true moving down" do
      game = FactoryBot.create(:game)
      piece1 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 0, ycoordinate: 6)
      piece2 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 0, ycoordinate: 3)

      result = piece1.is_obstructed?(0, 0)
      expect(result).to eq (true)
    end

    it "ycoordinate move if a piece is not in the way return false moving down" do
      game = FactoryBot.create(:game)
      piece1 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 0, ycoordinate: 3)
      piece2 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 0, ycoordinate: 4)

      result = piece1.is_obstructed?(0, 1)
      expect(result).to eq (false)
    end

    it "diagonal move if a piece is in the way return true moving up" do
      game = FactoryBot.create(:game)
      piece1 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 0, ycoordinate: 0)
      piece2 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 3, ycoordinate: 3)

      result = piece1.is_obstructed?(6, 6)
      expect(result).to eq (true)
    end

    it "diagonal move if a piece is not in the way return false moving up" do
      game = FactoryBot.create(:game)
      piece1 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 0, ycoordinate: 0)
      piece2 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 3, ycoordinate: 3)

      result = piece1.is_obstructed?(2, 2)
      expect(result).to eq (false)
    end

    it "diagonal move if a piece is in the way return true moving down" do
      game = FactoryBot.create(:game)
      piece1 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 6, ycoordinate: 6)
      piece2 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 3, ycoordinate: 3)

      result = piece1.is_obstructed?(0, 0)
      expect(result).to eq (true)
    end

    it "diagonal move if a piece is not in the way return false moving down" do
      game = FactoryBot.create(:game)
      piece1 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 6, ycoordinate: 6)
      piece2 = FactoryBot.create(:piece, game_id: game.id, xcoordinate: 1, ycoordinate: 1)

      result = piece1.is_obstructed?(2, 2)
      expect(result).to eq (false)
    end

    it "raises an expection" do
      expect { piece1.is_obstructed?(5, 5) }.to raise_error
    end    
  end
end

      # invalid move handling
      # ruby raise_error
      # raise_error 'that is not a valid move'
      # google ruby's raise_error method
      # also google 'rspec expect error to be raised'
      #^^^ expect { piece1.is_obstructed?(5,5) }.to raise_error

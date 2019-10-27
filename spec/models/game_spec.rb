require "rails_helper"

RSpec.describe 'Game' do 
  it 'should populate the pieces for the specified game' do
  	user = FactoryBot.create(:user)
    game = user.games.create()
    game.initialize_board
    expect(game.pieces.all.length).to eq(32)
  end
end
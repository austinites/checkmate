require "rails_helper"

RSpec.describe 'User' do 
  it 'is valid' do
    user = FactoryBot.create(:user)

    expect(user).to be_valid
  end
end
class AddColorTurnToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :color_turn, :string
  end
end

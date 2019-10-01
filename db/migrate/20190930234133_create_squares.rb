class CreateSquares < ActiveRecord::Migration[5.2]
  def change
    create_table :squares do |t|
      t.integer :board_id
      t.integer :x_coordinate
      t.integer :y_coordinate
      t.string :piece_type
      #t.string :square_color
      t.integer :piece_owner_id
      t.integer :in_check_player_id
      t.timestamps
    end
  end
end

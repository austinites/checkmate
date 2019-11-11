class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.integer :xcoordinate
      t.integer :ycoordinate
      t.string :piece_type
      t.string :color
      t.integer :piece_owner_id
      t.integer :in_check_player_id #???
      t.timestamps
    end
  end
end




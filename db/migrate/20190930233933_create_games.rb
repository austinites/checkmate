class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :session_id
      t.integer :player1_id
      t.integer :player2_id
      t.integer :turn_number
      t.timestamps
    end
  end
end

class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.integer :bet_amount
      t.boolean :matching_square
      t.boolean :matching_color
      t.integer :payout

      t.timestamps
    end
  end
end

class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.references :team

    	t.string :location
    	t.datetime :game_date
    	
      t.timestamps null: false
    end
  end
end

class AddIndexes < ActiveRecord::Migration
  def change
  	add_index :games, :team_id
  	add_index :practices, :team_id
  	add_index :payments, :team_id
  	add_index :team_rosters, :team_id

  	add_index :teams, :name
  end
end

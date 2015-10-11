class AddFieldsToGame < ActiveRecord::Migration
  def change
  	add_column :games, :opponent_name, :string
  	add_column :games, :team_score, :integer
  	add_column :games, :opponent_score, :integer
  end
end

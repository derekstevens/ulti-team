class AddStartAndEndtTimesToGamesandPractices < ActiveRecord::Migration
  def change
  	add_column :games, :start_time, :time
  	add_column :games, :end_time, :time

  	add_column :practices, :start_time, :time
  	add_column :practices, :end_time, :time

  	change_column :games, :game_date, :date
  	change_column :practices, :practice_date, :date
  end
end

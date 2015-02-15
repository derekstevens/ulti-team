class Game < ActiveRecord::Base
	belongs_to :team

	validates :location, presence: true
	validates :game_date, presence: true
	validates :game_date, schedule: true 

end

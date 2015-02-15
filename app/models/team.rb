class Team < ActiveRecord::Base
	has_many :team_rosters
	has_many :games
	has_many :practices
	
	validates :name, presence: true
	validates :location, presence: true

end

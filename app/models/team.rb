class Team < ActiveRecord::Base
	has_many :team_rosters
	
	validates :name, presence: true
	validates :location, presence: true

end

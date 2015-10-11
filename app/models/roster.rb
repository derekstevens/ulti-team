class Roster < ActiveRecord::Base
	belongs_to :user
	belongs_to :team_roster
end

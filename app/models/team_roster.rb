class TeamRoster < ActiveRecord::Base
	belongs_to :team
	has_many :rosters

	def add_current_user_as_captain(user)
		roster = Roster.new(:user_id => user.id, :team_roster_id => self.id, :captain => true)
		roster.save
	end
end

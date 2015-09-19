class UserDashboard
	attr_reader :user

	def initialize(user)
		@user = user
	end

	def teams
		current_teams = []
    current_rosters = Roster.where("user_id = ?", @user.id)
    current_rosters.includes(:team_roster).each do |r|
      if r.team_roster.current?
        current_teams << Team.find(r.team_roster.team_id)
      end
    end
    current_teams
  end

end
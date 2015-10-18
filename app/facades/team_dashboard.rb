class TeamDashboard
	attr_reader :team 

	def initialize(team)
		@team = team
	end

  def current_roster
  	team_roster = TeamRoster.where("team_id = ? AND current = ?", @team.id, true).first
  	rosters = team_roster.rosters.all
  end

  def schedule
  	schedule = TeamSchedule.new(@team)
  end
end
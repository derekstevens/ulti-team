class TeamSchedule
	attr_reader :team

	def initialize(team)
		@team = team
	end

	def events
  	events = Game.where(team_id: @team.id)
  	events = events + Practice.where(team_id: @team.id)
  end
end
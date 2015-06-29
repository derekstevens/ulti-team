class TeamDashboard
	attr_reader :team 

	def initialize(team)
		@team = team 
	end

	def next_games(team)
  	games = Game.where("team_id = ? AND game_date > ?", team.id, Date.today).order(game_date: :asc).last(3)
  end

  def last_game(team)
  	game = Game.where("team_id = ? AND game_date < ?", team.id, Date.today).order(game_date: :asc).last(1)
  end

  def roster(team)
  	team_roster = TeamRoster.where("team_id = ? AND current = ?", team.id, true).first
  	rosters = team_roster.rosters.all
  end
end
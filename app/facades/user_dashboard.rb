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

  def next_games(team)
  	games = Game.where("team_id = ? AND game_date > ?", team.id, Date.today).order(game_date: :asc).last(3)
  end

  def last_game(team)
  	game = Game.where("team_id = ? AND game_date < ?", team.id, Date.today).order(game_date: :asc).last(1)
  end
end
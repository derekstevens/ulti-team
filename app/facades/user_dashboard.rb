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

  def team_events(team)
    events = Game.where(team_id: team.id)
    events = events + Practice.where(team_id: team.id)
  end

  def team_payment(team)
    user_payments = @user.user_payments.select{|payment| payment.payment.team_id == team.id && payment.amount_paid < payment.amount_due}
  end
end
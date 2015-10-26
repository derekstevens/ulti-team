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

  def total_payments_due
  	amount = Money.new('0', 'USD')
  	@team.payments.each do |payment|
  		amount = amount + payment.amount
  	end
  	amount
  end

  def total_payments_paid
  	amount = Money.new('0', 'USD')
  	@team.payments.each do |payment|
  		amount = amount + payment.paid_amount
  	end
  	amount
  end

  def total_payments_ratio
  	(total_payments_paid / total_payments_due) * 100
  end
end
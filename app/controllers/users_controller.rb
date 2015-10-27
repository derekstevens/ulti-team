class UsersController < ApplicationController
	before_action :authenticate_user!, :except => [:show]

	def show
		@user = User.find(params[:id])
		@teams = find_teams(@user)
	end

	def dashboard
		@dashboard = UserDashboard.new(current_user)
	end

	def schedule
		@schedule = UserSchedule.new(current_user)
	end

	def payments
		@user_payments = current_user.user_payments.select{|payment| payment.amount_paid < payment.amount_due }
	end

	private

		def find_teams(user)
			current_teams = []
	    current_rosters = Roster.where("user_id = ?", user.id)
	    current_rosters.includes(:team_roster).each do |r|
	      if r.team_roster.current?
	        current_teams << Team.find(r.team_roster.team_id)
	      end
	    end
	    current_teams
		end


end

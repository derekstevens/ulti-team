class RostersController < ApplicationController
	before_filter :authenticate_user!
	
	def new
		@roster = Roster.new
	end

	def create
		@roster = Roster.new roster_params
	end

	def destroy
		@roster = Roster.find params[:id]
		team_roster = TeamRoster.find(@roster.team_roster_id)
		@roster.delete
		redirect_to team_team_roster_path(team_roster.team, team_roster)
	end

	private

		def roster_params
			params.require(:roster).permit(:captain)
		end
end

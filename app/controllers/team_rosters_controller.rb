class TeamRostersController < ApplicationController

	def new
		@team = Team.find(params[:id])
		@team_roster = TeamRoster.new team_roster_params
	end

	def create
		@team = Team.find(params[:id])
		@team_roster = @team.team_rosters.build team_roster_params
		@team_roster.save
	end

	private

		def team_roster_params
			params.require(:team_roster).permit(:name)
		end
end

class TeamRostersController < ApplicationController

	def show
		@team = Team.find(params[:team_id])
		@team_roster = TeamRoster.find(params[:id])
	end

	def new
		@team = Team.find(params[:team_id])
		@team_roster = TeamRoster.new
	end

	def create
		@team = Team.find(params[:team_id])
		@team_roster = @team.team_rosters.build team_roster_params
		if @team_roster.save
			if @team_roster.current?
				uncheck_old_roster_current(@team, @team_roster)
				@team_roster.add_current_user_as_captain(current_user)
			end
	
			redirect_to team_team_roster_path(@team, @team_roster)
		else
			render :new
		end

	end



	private

		def team_roster_params
			params.require(:team_roster).permit(:name, :current)
		end

		def uncheck_old_roster_current(team, team_roster)
			old_roster = TeamRoster.where("team_id = ? AND current = ? AND updated_at < ?", team.id, true, team_roster.updated_at).first
			old_roster.current = false
			old_roster.save
		end

	
end

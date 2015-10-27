class TeamRostersController < ApplicationController
	before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy, :copy, :toggle_captain, :manage]

	def index
		@team = Team.find(params[:team_id])
		@team_rosters = @team.team_rosters.order('created_at DESC') 
	end

	def show
		@team = Team.find(params[:team_id])
		@team_roster = TeamRoster.find(params[:id])
	end

	def manage
		@team = Team.find(params[:team_id])
		@team_roster = TeamRoster.find(params[:id])
		@roster_invite = RosterInvite.new
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

	def edit
		@team = Team.find params[:team_id]
		@team_roster = TeamRoster.find params[:id]
	end

	def update
		@team = Team.find params[:team_id]
		@team_roster = TeamRoster.find params[:id]

		if @team_roster.update_attributes team_roster_params
			if @team_roster.current?
				uncheck_old_roster_current(@team, @team_roster)
				@team_roster.add_current_user_as_captain(current_user)
			end
			redirect_to team_team_roster_path(@team, @team_roster)
		else
			render :edit
		end
	end

	def destroy
		@team = Team.find params[:team_id]
		@team_roster = TeamRoster.find params[:id]

		@team_roster.destroy
		redirect_to @team
	end

	def copy
		@team = Team.find params[:team_id]
		@team_roster = TeamRoster.find params[:id]

		@new_team_roster = @team_roster.dup
		if @new_team_roster.save
			@team_roster.rosters.each do |roster|
				new_roster = Roster.new(team_roster_id: @new_team_roster.id, user_id: roster.user_id)
				new_roster.captain = roster.captain
				new_roster.save
			end
			redirect_to edit_team_team_roster_path(@team, @new_team_roster)
		else
			render :show
		end
	end

	def toggle_captain
		@roster = Roster.find params[:player]
		@team = Team.find params[:team_id]
		@team_roster = TeamRoster.find params[:id]

		if @roster.captain?
			@roster.captain = false
		else
			@roster.captain = true
		end

		if @roster.save
			redirect_to team_team_roster_path(@team, @team_roster)
		else
			/ TODO Error validation /
			render :show
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

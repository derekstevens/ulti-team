class TeamsController < ApplicationController
	before_filter :authenticate_user!, :only => [:new, :create]
	before_filter :authenticate_captain!, :only => [:edit, :update, :destroy]
	
	def show
		@team = Team.find params[:team_id]
	end
	
	def new
		@team = Team.new
	end

	def create
		@team = Team.new team_params

		@team.team_admin_id = current_user.id
		if @team.save
			create_default_team_roster(@team)
			redirect_to @team
		else
			render :new
		end
	end

	def edit
		@team = Team.find params[:team_id]
	end

	def update
		@team = Team.find params[:team_id]
		if @team.update_attributes team_params
			redirect_to @team 
		else 
			render :edit
		end
	end

	def edit_team_admin
		@team = Team.find params[:team_id]
		@team_roster = @team.team_rosters.where("current = ?", true).first

		@captains = @team_roster.rosters.where("captain = ? AND user_id != ?", true, current_user.id)
	end

	def update_team_admin
		@team = Team.find params[:team_id]
		@team.team_admin_id = params[:team_admin_id]
		if @team.save
			redirect_to @team
		else
			render :edit_team_admin
		end
	end


	def destroy
		@team = Team.find params[:team_id]

		@team.destroy
		redirect_to root_path
	end

	private

		def team_params
			params.require(:team).permit(:name, :location, :team_admin_id)
		end

		def create_default_team_roster(team)
			team_roster = TeamRoster.new(:name => "#{team.name} #{Time.now.year}", :team_id => team.id, :current => true)
			team_roster.save
			team_roster.add_current_user_as_captain(current_user)
		end


end

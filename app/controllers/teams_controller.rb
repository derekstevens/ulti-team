class TeamsController < ApplicationController
	before_filter :authenticate_user!, :only => [:new, :create]
	before_filter :authenticate_captain!, :only => [:edit, :update]
	
	def show
		@team = Team.find params[:id]
	end
	
	def new
		@team = Team.new
	end

	def create
		@team = Team.new team_params
		if @team.save
			create_default_team_roster(@team)
			redirect_to @team
		else
			render :new
		end
	end

	def edit
		@team = Team.find params[:id]
	end

	def update
		@team = Team.find params[:id]
		if @team.update_attributes team_params
			redirect_to @team 
		else 
			render :edit
		end
	end

	private

		def team_params
			params.require(:team).permit(:name, :location)
		end

		def create_default_team_roster(team)
			team_roster = TeamRoster.new(:name => "#{team.name} #{Time.now.year}", :team_id => team.id, :current => true)
			team_roster.save
			team_roster.add_current_user_as_captain(current_user)
		end

		

		def authenticate_captain!
			team = Team.find(params[:id])
			team_roster = TeamRoster.where("team_id = ? AND current = ?", team.id, true).first
			roster = Roster.where("team_roster_id = ? AND user_id = ?", team_roster.id, current_user.id).first
			if roster.captain? == false
				redirect_to team
			end
		end
end

class GamesController < ApplicationController
	before_filter :authenticate_captain!, :only => [:new, :create, :edit, :update, :destroy]

	def new
		@team = Team.find params[:team_id]
		@game = Game.new
	end

	def create

	end

	def show
		@team = Team.find params[:team_id]
		@game = Game.find params[:id]
	end

	def edit
		@team = Team.find params[:team_id]
		@game = Game.find params[:id]
	end

	def update

	end

	def destroy

	end

	private

		def authenticate_captain!
			team = Team.find(params[:team_id])
			team_roster = TeamRoster.where("team_id = ? AND current = ?", team.id, true).first
			roster = Roster.where("team_roster_id = ? AND user_id = ?", team_roster.id, current_user.id).first
			if roster.nil? || roster.captain? == false
				redirect_to team
			else
				roster.captain
			end
		end
end

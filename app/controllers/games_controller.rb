class GamesController < ApplicationController
	before_filter :authenticate_captain!, :only => [:new]

	def new

	end

	def show
		@team = Team.find params[:team_id]
		@game = Game.find params[:id]
	end

	private

		def authenticate_captain!
			team = Team.find(params[:team_id])
			team_roster = TeamRoster.where("team_id = ? AND current = ?", team.id, true).first
			roster = Roster.where("team_roster_id = ? AND user_id = ?", team_roster.id, current_user.id).first
			roster.captain?
		end
end

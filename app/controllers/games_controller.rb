class GamesController < ApplicationController
	before_filter :authenticate_captain!, :only => [:new, :create, :edit, :update, :destroy]

	def index
		@team = Team.find params[:team_id]
		@games = @team.games
	end

	def new
		@team = Team.find params[:team_id]
		@game = Game.new
	end

	def create
		@team = Team.find params[:team_id]
		@game = Game.create game_params
		@game.team_id = @team.id
		if @game.save
			redirect_to team_game_path(@team, @game)
		else
			render :new
		end
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
		@team = Team.find params[:team_id]
		@game = Game.find params[:id]

		if @game.update_attributes game_params
			redirect_to team_game_path(@team, @game)
		else
			render :edit
		end
	end

	def destroy
		@team = Team.find params[:team_id]
		@game = Game.find params[:id]

		@game.destroy
		redirect_to @team
	end

	private

		def game_params
			params.require(:game).permit(:game_date, :location, :opponent_name, :team_score, :opponent_score)
		end

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

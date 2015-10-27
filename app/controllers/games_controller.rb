class GamesController < ApplicationController
	before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

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
		@game = Game.new game_params
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
			params.require(:game).permit(:game_date, :location, :opponent_name, :team_score, :opponent_score, :start_time, :end_time)
		end

end

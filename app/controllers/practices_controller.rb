class PracticesController < ApplicationController
	def index
		@team = Team.find params[:team_id]
		@practices = @team.practices
	end

	def show
		@team = Team.find params[:team_id]
		@practice = Practice.find params[:id]
	end

	def edit
		@team = Team.find params[:team_id]
		@practice = Practice.find params[:id]
	end

	def update
		@team = Team.find params[:team_id]
		@practice = Practice.find params[:id]

		if @practice.update_attributes practice_params
			redirect_to team_practice_path(@team, @practice)
		else
			render :edit
		end
	end

	def new
		@team = Team.find params[:team_id]
		@practice = Practice.new
	end

	def create
		@team = Team.find params[:team_id]
		@practice = Practice.new practice_params
		@practice.team_id = @team.id
		if @practice.save
			redirect_to team_practice_path(@team, @practice)
		else
			render :new
		end
	end

	def destroy
		@team = Team.find params[:team_id]
		@practice = Practice.find params[:id]

		@practice.destroy
		redirect_to @team
	end

	private

		def practice_params
			params.require(:practice).permit(:practice_date, :location, :start_time, :end_time)
		end
end

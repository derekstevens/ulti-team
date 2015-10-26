class EventsController < ApplicationController
		before_filter :authenticate_user!, :only => [:new, :create, :destroy]
		before_filter :authenticate_created_by_user!, :only => [:edit, :update]

	def index
		@team = Team.find params[:team_id]
		@events = @team.events
	end

	def new
		@team = Team.find params[:team_id]
		@event = Event.new
	end

	def create
		@team = Team.find params[:team_id]
		@event = Event.new event_params
		@event.team_id = @team.id
		@event.created_by_user_id = current_user.id 
		if @event.save
			redirect_to team_event_path(@team, @event)
		else
			render :new
		end
	end

	def show
		@team = Team.find params[:team_id]
		@event = Event.find params[:id]
	end

	def edit
		@team = Team.find params[:team_id]
		@event = Event.find params[:id]
	end

	def update
		@team = Team.find params[:team_id]
		@event = Event.find params[:id]

		if @event.update_attributes event_params
			redirect_to team_event_path(@team, @event)
		else
			render :edit
		end
	end

	def destroy
		@team = Team.find params[:team_id]
		@event = Event.find params[:id]

		@event.destroy
		redirect_to @team
	end

	private

		def event_params
			params.require(:event).permit(:title, :event_date, :description, :location, :start_time, :end_time)
		end

		def authenticate_created_by_user
			event = Event.find params[:id]
			if current_user.id != event.created_by_user_id
				redirect_to event.team
			end
		end
end

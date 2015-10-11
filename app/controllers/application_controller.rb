class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  	def configure_permitted_parameters
  		devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:first_name, :last_name, :position, :years_playing, :bio, :location, :is_female, :date_of_birth, :email, :password, :current_password)}
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

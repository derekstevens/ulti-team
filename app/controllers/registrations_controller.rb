class RegistrationsController < Devise::RegistrationsController
	def update
		@user = User.find(current_user.id)

		@user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
		if @user.save
			set_flash_message :notice, :updated 
			redirect_to after_update_path_for(@user)
		else
			render "edit"
		end
	end
	protected

	def after_sign_up_path_for(resource)
		edit_user_registration_path(resource)
	end

	def after_update_path_for(resource)
		user_path(resource)
	end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def is_admin?
	current_user.admin?
  end
  
  def is_admin!
	if current_user.nil?
		redirect_ to new_user_session_path
	elsif current_user.admin == false
		redirect_to root_path, alert: "You must be an admin to access this feature."
			
	end
  end
  helper_method :is_admin?
  helper_method :is_admin!
end

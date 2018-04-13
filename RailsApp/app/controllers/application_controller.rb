class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  protected
	 
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :address) }
	  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :address, :current_password) }
    end
    
    def after_sign_in_path_for(resource)
		Loginhistory.create(user_id: current_user.id, ip_address: request.remote_ip)
		
			request.env['omniauth.origin'] || stored_location_for(resource) || root_path
		
  end
		
	
	def after_sign_out_path_for(resource_or_scope)
		reset_session
		root_path
	end
   
    def after_sign_up_path_for(resource)
		 Loginhistory.create(user_id: current_user.id, ip_address: request.remote_ip)
		request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end
    
    def after_update_path_for(resource)
		 request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end

end

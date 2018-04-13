class UserController < ApplicationController
	
	def login
	
	end
	
	def login_user
		@user =  User.find_by('(lower(username) = ? or lower(email) = ?) and password = ?', params[:username].downcase, params[:username].downcase, params[:psw])
		if @user
			Loginhistory.create(user_id: @user.id, ip_address: request.remote_ip).valid?
			session[:user_id] = @user.id
			redirect_to root_path , flash: {notice: "You have successfully logged in"}	if session[:program_id].nil?
			redirect_to :controller => 'program', :action => 'show', :id  => session[:program_id], :input => params[:input], :output => params[:output] if session[:program_id].nil? == false
		else
			redirect_to :controller => 'user', :action => 'login'
		end
				
	end
	
	
	def signup
		
	end
	
	def user_signup
		@user = User.new(username: params[:username], password: params[:psw], email: params[:email], address: params[:address], latitude: params[:latitude].split(",")[0], longitude: params[:latitude].split(",")[1])
		if @user.valid?(:new)
			if User.find_by(email: @user.email) == nil 
				@user.save!
				login_user	
			else
				redirect_to({ :controller => 'user', :action => 'signup'}, :error => "User already Present")
			end
		else
			render 'user/signup'
		end
	end

	
	def update_user
		p params[:user][:address]
		 @user = User.find_by(id: session[:user_id])
		 @user.update(username: params[:user][:username], address: params[:user][:address], latitude: params[:latitude].split(",")[0], longitude: params[:latitude].split(",")[1])
		 redirect_to(request.env['HTTP_REFERER'], flash: {notice: "User Profile Updated"})
	end
	
	def logout
		reset_session
		redirect_to root_path
	end
	
end					
					
						
						
									 

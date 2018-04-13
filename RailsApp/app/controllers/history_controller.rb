class HistoryController < ApplicationController

	def program_history
	    @programhistory, @program  = Programhistory.where(program_id: session[:program_id]).order(id: :desc), Program.find_by(id: session[:program_id])
		
	end
	
	def login_history
		@loginhistory = Loginhistory.where(user_id: current_user.id).order(id: :desc)
	end
	
	def login_history_pdf
		Loginhistory.pdf(current_user, request.remote_ip)
		 redirect_to(request.env['HTTP_REFERER'], flash: {notice: "Pdf generated successfully"}) 
	end
	
	def program_history_pdf
		 @user, @program = User.find_by(id: session[:user_id]), Program.find_by(id: session[:program_id])
		Programhistory.pdf(current_user, @program)
		redirect_to(request.env['HTTP_REFERER'], flash: {notice: "Pdf generated successfully"}) 
	end
end

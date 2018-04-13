class MailController < ApplicationController

	def contact_us
		
	end
	
	def send_mail
		@user_mailer = UserMailer.new
		@user_mailer.email, @user_mailer.name, @user_mailer.mail_subject, @user_mailer.user_message = params[:mail], params[:Name], params[:subject], params[:message] 
		ActionMailer::Base.mail(from: 'ananth.kumar48@gmail.com', to: 'ananth.kumar48@gmail.com', subject: "#{params[:subject]}", body: "#{params[:message]}\n #{params[:name]}\n #{params[:mail]}").deliver
		@user_mailer.contact_us(@user_mailer).deliver
		redirect_to(request.env['HTTP_REFERER'], flash: {notice: "Mail Sent successfully"})
		
	end
	
	def mail_program_pdf
		 @program =  Program.find_by(id: session[:program_id]) 
	end
	
	def mail_pdf
		@user_mailer, @program, @user_mailer.params, @user_mailer.email = UserMailer.new,  Program.find_by(id: session[:program_id]),  params, params[:to]
		Programhistory.pdf(current_user, @program)
		@user_mailer.pdf( @program, @user_mailer).deliver
		redirect_to({:controller => 'history', :action => 'program_history'}, flash: {notice: "Mail Sent successfully"})
	end
	
	def mail_login_pdf
		
	end
	
	def mail_login_history_attachment
		@user_mailer,  @user_mailer.params, @user_mailer.email, @program = UserMailer.new,  params, params[:to], Program.find_by(id: session[:program_id])
		Loginhistory.pdf(current_user, request.remote_ip)
		@user_mailer.pdf(@program, @user_mailer).deliver
		redirect_to({:controller => 'history', :action => 'login_history'}, flash: {notice: "Mail Sent successfully"})
	end
end

class UserMailer < ApplicationMailer
	attr_accessor :email, :mail_subject, :name, :user_message
	default from: 'ananth.kumar48@gmail.com'
	
	def contact_us(user_mailer)
	   @user_mailer = user_mailer
	   begin
			mail(to: "#{@user_mailer.email}", subject: "#{@user_mailer.mail_subject}", body: "Hello #{@user_mailer.name}, we have got your query and we would get you back soon")
	   rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
		  return "error"
	   end
	end
	
	def pdf(program, user_mailer)
		@user_mailer,  @program = user_mailer, program
		begin
			p attachments["#{@user_mailer.params[:attachment]}"] = File.read("#{@user_mailer.params[:attachment]}")
			mail(to: "#{@user_mailer.email}", subject: "#{@user_mailer.params[:message]}", body: "#{@user_mailer.params[:attachment]}")
	rescue Exception => e
		print e
	end
end
end

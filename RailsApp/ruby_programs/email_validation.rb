class EmailValidation
	def email_validation file_name
		begin
			File.open(file_name, "r").each do | email |
				if email.chomp.length == 0
					puts "the line in blank"
				else	
					email.each_line do |email|
						if email.match(/\A[\w+\_\-\.]+\@[\w\_\-]+(\.[\w\-]+)*\.[a-z]/)
							puts "true"
						else
							puts "false"    
						end 
					end	
				end
			end
		rescue Exception => e
			puts e.message
		end	
	end
end	
file = ARGV[0]
email_validation = EmailValidation.new
email_validation.email_validation file

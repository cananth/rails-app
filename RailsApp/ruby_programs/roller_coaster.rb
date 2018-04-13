class RollerCoaster
	def roller_coaster file_name
		begin
			File.open(file_name, "r").each do| data |
				if data.chomp.length == 0 or data.to_i != 0
					puts "the line is empty or the given input is in integer format"
				else	
					characters = data.chomp.split("")
						result = " "
						count = 0
						(0..characters.length - 1).each do |index|
							if characters[index].match(/\w/) 
								if count == 0
									result << characters[index].upcase
									count = 1
								elsif count == 1
									result << characters[index].downcase
									count = 0
								end
							else
								result << characters[index]
							end
						end
						puts result	
				end		
			end
		rescue Exception => e
			puts e.message
		end	
	end	
end
file = ARGV[0]
rollercoaster = RollerCoaster.new
rollercoaster.roller_coaster file

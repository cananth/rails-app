class SumOfDigits
	def get_sum_of_digits(file_name)
		begin
			File.open(file_name, "r").each do |file_data|
				if file_data .chomp == nil or file_data.to_i == 0
					puts "the line is empty or it is a string"
				else	
					number = file_data.to_i
					sum = 0
					if number.to_i!=0
						while number > 0 do
							remainder = number % 10
							sum = sum + remainder
							number = number / 10
						end
						puts sum
					end
				end   
			end
		rescue Exception => b
			puts b.message << " <---this is the exception"
		end	
	end	
end
file_name = ARGV[0]
sum_of_digits = SumOfDigits.new
sum_of_digits.get_sum_of_digits(file_name)


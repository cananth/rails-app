class PrimeNumber
	def get_prime_number file_name
		File.open(file_name, "r").each do |line|
			data = line.split(" ")
			if data.length == 2
				flag = 0
				count = 0
				prime_number = []
				for values in (data[0].to_i..data[1].to_i) do
					for number in 2...values do
						if number < values
							if values % number == 0
								flag = 1
								break
							else
								flag = 0
							end	
						end
					end
					if flag == 0
						prime_number << values
						for index in 0...prime_number.length do
							if values == prime_number[index].to_i + prime_number[index + 1].to_i + 1
								puts values
								count = count + 1
							end
						end
					end
				end
			puts "The Number of possible consecutive prime sum is : #{count}"
			elsif data.length == 0
				puts "Empty Line"
			else	
				puts "Invalid Input"
			end
		end
	end
end	
file_name = ARGV[0]
prime_number_object = PrimeNumber.new
prime_number_object.get_prime_number file_name

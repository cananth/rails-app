class FizzBuzz
	def fizz_buzz file_name
		begin
			File.open(file_name,"r").each do | file |
				splitted_line = file.split(" ")
				if splitted_line.length < 3 
					puts "that is invalid data" 
				else
					index = 1
						(index..splitted_line[2].to_i ).each do index
							if((index % (splitted_line[0].to_i * splitted_line[1].to_i )) == 0)
								print "FB"
							elsif((index % splitted_line[0].to_i) == 0)
								print "F"
							elsif(( index % splitted_line[1].to_i ) == 0)
								print "B"
							else 
								print index
							end
							print " "
							index = index + 1 
						end
						puts	 
				end
			end
		rescue Exception => e
			puts e.message
		end	
	end
end
file = ARGV[0]
fizzbuzz = FizzBuzz.new
fizzbuzz.fizz_buzz file


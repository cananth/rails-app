class ShortestRepition
	def shortest_reptition file_name
		begin
			File.open(file_name, "r").each do | value |
				if value.chomp.length == 0
					puts " there are no string to be processed"
				elsif value.chomp.to_i !=0 or value.include? " " or 
					puts "plz give characters to compare or plz avoid spaces in between" 
				else
					count = 1
					length_of_data = value.chomp.length
					(1...length_of_data).each do |index|
						if value[index] != value[index - count]
							count += 1
						end  		
					end
					puts count
				end    
			end
		rescue Exception => e
			puts e.message
		end	
	end		
end

file = ARGV[0]
shortest_reptition = ShortestRepition.new
shortest_reptition.shortest_reptition file

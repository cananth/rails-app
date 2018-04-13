class SwapCase
	def swap_case file_name
		begin
			File.open(file_name, "r").each do |value|
				swap_case = value.chomp 
				if swap_case.length == 0   
					puts " It is empty"
				elsif swap_case.to_i != 0
					puts "it is an integer"  
				else   
					puts swap_case.swapcase
				end
			end
		rescue Exception => e
			puts e.message
		end	
	end    		
end
file = ARGV[0]
swapcase = SwapCase.new
swapcase.swap_case file

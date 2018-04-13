class Longest
	def longest_word file_name
		begin
			File.open(file_name , "r").each do |line|
				if line.chomp.length == 0 or line.chomp.to_i !=0
					puts "the line is empty or contains integer"
				else	
					char = line.split(" ")
					for index in (0..char.length-1)
						for index_j in (1..char.length-1)
							if(char[index].length < char[index_j].length)
								temp = char[index]
								char[index] = char[index_j]
								char[index_j] = temp
							end	
						end
					end
					puts char[0]	
				end
			end	
		rescue Exception => e
			e.message
		end	
	end
end
file = ARGV[0]
longestword = Longest.new
longestword.longest_word file




class Panagram
	def panagram file_name
		begin
			File.open(file_name, "r").each_line do |line|
				missing_letters = []
				if line.chomp.length == 0
					puts "line is empty"
				else	
					unless line.empty?
						line_new = line.chomp.downcase
						('a'..'z').each do |letter|
							if line_new.index(letter).nil?
								missing_letters << letter
							end
						end
					end
					if missing_letters.size == 0 
						puts 'NULL'
					else
						puts missing_letters.join(' ')
					end
				end
			end
		rescue Exception => e
			puts e.message
		end	
	end
end		
file = ARGV[0]
panagram = Panagram.new
panagram.panagram file


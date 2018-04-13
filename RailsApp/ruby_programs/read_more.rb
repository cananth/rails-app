class ReadMoreCharacters
	def read_more_characters file_name
		begin
			File.open(file_name, "r").each do |data|
				if data.chomp.empty?
					puts "the line has no data"
				else   
					if data.length <= 55 
						print data
					elsif data.length > 55
						puts data[0..40].strip.gsub(/s*\w+\s*$/,'...<Read More>\n')	
					end
				end
			end
       rescue Exception => e
		  puts e.message
		end
    end            
end
file = ARGV[0]
read_more_characters = ReadMoreCharacters.new
read_more_characters.read_more_characters file

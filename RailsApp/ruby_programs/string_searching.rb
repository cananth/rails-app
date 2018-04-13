class StringSearch
	def string_search file_name
		begin
			File.open(file_name, "r").each do | value |
				if value.split(",").length == 2
					spliting = value.chomp.split(",")
					if spliting[0].match(spliting[1].gsub("*","*"))
						puts "true"
					else
						puts "false"
					end
				else
					puts "invalid data" 
				end
			end
		rescue Exception => e
			puts e.message
		end	
    end		 
end
file = ARGV[0]
string_search = StringSearch.new
string_search.string_search file

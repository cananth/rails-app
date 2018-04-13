class StringRotation
	def string_rotation file_name
		begin
			flag = 0
			File.open(file_name, "r").each do |value|
				if value.chomp.length == 0
					puts "plz enter the input without leaving it blank"
				else	   
					value = value.split(",")
					original_string = value[0].chomp
					string_to_compare = value[1].chomp
					if ( original_string.length != string_to_compare.length)
						puts "strings have differnt lengths"
					elsif ( original_string.to_i != 0 or string_to_compare.to_i != 0 )
						puts "plz enter in the correct format"
					else
						for index in (0.. original_string.length)
							for j_index in (0..string_to_compare.length)
								if(original_string[index] == string_to_compare[j_index])
									flag = 1
								else
									flag = 0
									break	
								end   		
							end	
						end 
						p "true" if flag ==1
						p "false"  if flag ==0
					end 
				end
			end
		rescue Exception => e
			puts e.message
		end	
	end		
end
file = ARGV[0]
string_rotation = StringRotation.new
string_rotation.string_rotation file

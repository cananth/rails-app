class ReverseGroups
	def reverse_groups file_name
		begin 
			File.open(file_name, "r").each do |value|
				if value.chomp.length == 0 or value.chomp.to_i == 0
					puts "the line is empty or the data given is not in the appropriate form"
				else	
					value = value.chomp.split(";")
					list_of_num = value[0]
					key = value[1].to_i
					reverse_array = reverse_number( list_of_num, key )
				end
			end	
		rescue Exception => e
			puts e.message +   "<-- plz give the proper file name for the execution"
		end	
	end	 
    def reverse_number (list_of_num ,key)
		list_of_num = list_of_num.chomp.split(",")
		number_array = []
		for i in (0...list_of_num.length)
		   	 number = list_of_num.shift(key) 
			  if number.length == key
				number_array += number.reverse
			  else
			  number_array += number	
			  end
		end
		puts number_array.join
	end
end
file = ARGV[0]
reverse_groups = ReverseGroups.new
reverse_groups.reverse_groups file

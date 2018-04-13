class SplitTheNumber
	def get_pattern file_name
		begin
			File.open(file_name,"r").each do |values|
				line_data = values.chomp.split(" ")
				if line_data[1].include? ("+")
					position = line_data[1].index("+")
					p get_data("+",line_data[0],position)
				elsif
					position = line_data[1].index("-")
					p get_data("-",line_data[0],position)
				else
					puts " the line is empty or some other symbol is present"
				end	
			end
		rescue Exception => e
			puts e.message
		end	
    end   
    def get_data operation, line_data, position
		if operation == "+"
			line_data[0..position-1].to_i + line_data[position..-1].to_i
		else
			line_data[0..position-1].to_i - line_data[position..-1].to_i
		end
	end
end	
file=ARGV[0]
split_num = SplitTheNumber.new
split_num.get_pattern file

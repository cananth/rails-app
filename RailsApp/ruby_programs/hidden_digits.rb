class HiddenDigit
	def show_hidden_digit file_name
        File.open(file_name, "r").each do |line|
			if line.length > 1
				val = line.each_char.map { |char|
					if char.to_i.to_s == char
						char.to_i
					else
						('a'..'j').to_a.index(char)
					end
				}.join
				if (val.to_i >= 0) 
					puts val
				else
					puts "line empty"
				end
			else
				puts "empty line"
			end
		end
	end
end
file_name = ARGV[0] 
hidden_digit = HiddenDigit.new
puts hidden_digit.show_hidden_digit file_name

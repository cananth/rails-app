class JustifyText
	def justify_text file_name
		begin
			File.open(file_name, "r").each do |data|
				if data.length > 1
					splitted_line = data.chomp.split(" ")
					if data.count(' ') == 0 or data.count(' ') == 1
						puts data
					elsif data.count(' ') <= 4
						for index in (0...splitted_line.length) do
							print splitted_line[index] + '          '
						end
					else
						for index in (0...splitted_line.length) 
							if index == 0
								print splitted_line[index] + '    '
							elsif index == 1
								print splitted_line[index] + '    '
							elsif index == 2
								print splitted_line[index] + '   '
							else
								print splitted_line[index]
							end
						end
					end
				else
					puts "empty line"
				end
			end
		rescue Exception => e
			puts e.messagae
		end	
	end
end
file_name = ARGV[0]	
justify = JustifyText.new
justify.justify_text file_name

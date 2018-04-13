class StepWiseWord
   def step_wise_word file_name
		begin
			File.open(file_name,"r").each do |data|
				char = data.split(" ")
				char_max = char.max { |a, b| a.length <=> b.length }
				if char_max == nil
                  puts "empty string"
				else   
					char_max1 = char_max.split("")
					index = 0;
						char_max1.each do |value|
							print "*" * index
							print char_max1[index]
							print " " 
							index += 1 
						end
					puts
				end
           end
        rescue Exception => e
			puts e.message
		end	
    end
 end
file = ARGV[0]
stepwiseword = StepWiseWord.new
stepwiseword.step_wise_word(file)

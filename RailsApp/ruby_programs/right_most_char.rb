class RightMostChar
  def right_most_char file_name
	begin
        File.open(file_name,"r").each do |data|
            char_array = data.chomp.split(",")
            if char_array[1] == nil
				puts "there is no letter to search"
			else
				p char_array[0].rindex(char_array[1])
			end	
		end
	rescue Exception => e
		puts e.message
	end	
  end
end    
file=ARGV[0]
rightmostchar = RightMostChar.new
rightmostchar.right_most_char file



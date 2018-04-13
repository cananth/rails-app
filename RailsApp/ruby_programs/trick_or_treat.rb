class Halloween
  def halloween file_name	
	begin
		File.open(file_name,"r").each do |line|
			splitted_line = line.chomp.split(',')
				if splitted_line.length != 4
		             puts " contains no lines"
		        else     
					vampires = splitted_line[0].split(":")[1].strip.to_i
					zombies = splitted_line[1].split(":")[1].strip.to_i
					witches = splitted_line[2].split(":")[1].strip.to_i
					houses = splitted_line[3].split(":")[1].strip.to_i
					if vampires < 100 and zombies < 100 and witches < 100 and houses < 100
						candies = ((( vampires * 3 ) + ( zombies * 4 ) + ( witches * 5 )) * houses ) / ( vampires + zombies + witches )
						puts candies.floor
					
					else
						puts " the values are out of range"
					end	
		        end
		 end
	rescue Exception => fault
		puts fault.message
	end	
  end
end
file_name = ARGV[0]
halloween = Halloween.new
halloween.halloween(file_name) 

class CrackEggs
	def get_crack_eggs file_name
		begin
			File.open(ARGV[0]).each_line do |line|
				if line.split.length == 2
					data = line.split.map(&:to_i)
					no_of_floors = 0
					while do_operation(data[0], no_of_floors) < data[1]
						no_of_floors = no_of_floors + 1 
					end	
					puts no_of_floors
				else 
					puts "Invalid Input"
				end
			end
		rescue Exception => e
			puts e.message
		end		
	end	
	
	def do_operation eggs, floors
		if floors == 1
			return 1 
		elsif eggs == 1	
			return floors 
		elsif eggs == 0 || floors == 0	
			return 0 
		elsif eggs > floors
			return do_operation(floors, floors) 
		else	
			do_operation(eggs - 1, floors - 1) + do_operation(eggs, floors - 1) + 1
		end
	end
end
file_name = ARGV[0]
crack_eggs = CrackEggs.new
crack_eggs.get_crack_eggs file_name


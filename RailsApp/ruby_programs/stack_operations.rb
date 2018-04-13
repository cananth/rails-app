class StackOperation
	def push file_name
		begin
			stack = Array.new
			File.open(file_name, "r").each do |value|
				if value.chomp.length == 0
					puts "the input file is empty"
				elsif value.to_i == 0
					puts "plz provide integer for the pop and push opearation"
				else  
					value = value.chomp.split(" ")
					for index in (0...value.length)
						stack.push(value[index].to_i)
					end 
					pop (stack)	
				end
			end
		rescue Exception => e
			puts e.message
		end	
	end  
	def pop stack
		new_stack = Array.new
		while  stack.length != 0 do
			   new_stack = stack.pop(2)
			  p new_stack[1]
	    end   	
	end	
end
file = ARGV[0]
stack_operation = StackOperation.new
stack_operation.push file

class Launch
	def get_program
		count = 0;
		list_of_programs = [ "reverse_word_ananth", "sum_of_digits_ananth", "split_the_number_ananth", "hidden_digits_ananth", "longest_word_ananth", "fizz_buzz_ananth", "right_most_char_ananth", "step_wise_word_ananth", "roller_coaster_ananth", "string_seaching_ananth", "pangrams_ananth", "swap_case_ananth", "distinct_subsequnces_ananth", "sortest_repetition",
							"read_more_ananth", "trick_or_treat", "string_rotation_ananth", "text_dollar_ananth", "test_to_number_ananth", "compressed_sequence_ananth",
							"email_validation_ananth" , "justify_the_text_ananth", "robot_movements_ananth",  "cacking_eggs_ananth", "advanced_Calculator_ananth",  "working_experience_ananth", "prime_number_ananth",
							"stack_operations_ananth"]
		for index in (0..list_of_programs.length - 1)
			 puts count.to_s + "." + list_of_programs[index]
			  count = count + 1
		end  
		begin
			puts "Enter program number , which do you want to execute according to the above given list"
			puts program_number = gets.chomp.to_i	
				require (`ruby #{list_of_programs[program_number]}.rb #{list_of_programs[program_number]}.txt`)
			puts "do you want to continue Y/N"
			answer = gets.chomp
			
		end while answer == 'Y' or answer == 'y'	
			
	end		
end
launch = Launch.new
launch.get_program

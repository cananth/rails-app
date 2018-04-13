class ReverseWords
   def reverse_words file_name
		begin
			File.open(file_name,"r").each do |reverse_word|
				result_word = reverse_word.split.reverse.join(" ")
				if result_word.length == 0
					puts "please give a valid string"
				else
					puts result_word
				end
			end
		rescue Exception => e
			puts e.message
		end	
   end
end
file = ARGV[0]
reversewords = ReverseWords.new
reversewords.reverse_words file

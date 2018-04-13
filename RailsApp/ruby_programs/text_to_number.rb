class TextToNumber
	def convert_text_number file_name
		begin
			File.open(file_name, "r").each_line do |line|
				if line.chomp.split(" ").length >= 1
					string_array = ["zero", "hundred", "thousand", "million", "negative"]
					hash_single_number = { 'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4,'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9 }
					hash_of_tenth = { 'ten' => 10, 'eleven' => 11, 'twelve' => 12, 'thirteen' => 13, 'fourteen' => 14, 'fifteen' => 15, 'sixteen' => 16, 'seventeen' => 17, 'eighteen' => 18, 'nineteen' => 19 }
					hash_of_multiple = { 'twenty' => 20, 'thirty' => 30, 'forty' => 40, 'fifty' => 50, 'sixty' => 60, 'seventy' => 70, 'eighty' => 80, 'ninety' => 90 }
					unit = quarter = rupee = 0
					word = line.chomp.split
					if word[0] == string_array[-1]
						current_index = -1
						word.shift
					else 
						current_index = 1
					end
					word.each do |index|
						if index == string_array[0] then quarter = 0
						elsif hash_single_number[index] then unit = hash_single_number[index]
						elsif hash_of_tenth[index] then quarter += hash_of_tenth[index]
						elsif hash_of_multiple[index] then quarter += hash_of_multiple[index]
						elsif index == string_array[1]
							quarter = unit * 100
						elsif index == string_array[2]
							rupeey += (unit + quarter) * 1000
						elsif index == string_array[3]
							rupeey = (unit + quarter) * 1000000
						end
					end
					puts current_index * (rupee + quarter + unit)
				else
					puts "Empty input found"
				end
			end
		rescue Exception => e
			puts e.message
		end	
	end
end
file_name = ARGV[0]
text_number = TextToNumber.new
text_number.convert_text_number file_name

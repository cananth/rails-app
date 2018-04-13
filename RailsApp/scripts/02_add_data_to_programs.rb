require 'pg'
class Insert
	
	def insert_operation
		begin
			conn = PG.connect(:dbname => 'rails_db',:user => 'postgres', :password =>'postgres')
			hash = {1 => "Reverse Word", 2 => "Sum Of Digits", 3 => "Split The Number", 4 => "Hidden Digits", 5 => "Longest Word", 6 => "Fizz Buzz", 7 => "Right Most Char", 8 => "Step Wise Word", 9 => "Roller Coaster", 10 => "String Searching", 11 => "Pangrams", 12 => "Swap Case", 13 => "Distinct Subsequences", 14 =>"Shortest Repetition",
							15 => "Read More", 16 => "Trick Or Treat", 17 => "String Rotation", 18 => "Text Dollar", 19 => "Text To Number", 20 => "Compressed Sequence",
							21 => "Email Validation", 22 => "Justify The Text", 23 => "Robot Movements",  24 => "Cracking Eggs", 25 => "Advanced Calculator",  26 => "Working Experience", 27 => "Prime Number",
							28 => "Stack Operations"}
			print hash.length				
			(1..hash.length).each do |index|
				conn.exec("insert into programs ( program_name,author) values ('#{hash[index]}','ananth')")
			end
		rescue PG::Error => f
			puts f.message
		ensure
		 conn.close if conn	
		end
	end	
end
insert_data = Insert.new
insert_data.insert_operation

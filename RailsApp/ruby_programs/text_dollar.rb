class TextDollar
	def initialize hash
	@hash = hash
	end
	def text_dollar file_name
		begin
			File.open(file_name, "r").each do | value |
				integer_array = value.split(" ")
				integer_array = integer_array[0].split(" ")
				integer_array.each do | integer_array | 
					result_value = get_hash (integer_array)
					puts result_value if result_value.class != Hash
				end	
			end
		rescue Exception => e
			puts e.message
		end	
	end	
	def get_hash integer_array
		if integer_array.length == 0
			return "there is no input process"
		else
			if integer_array.length == 1
				print @hash[integer_array[0].to_i] << "Dollars"
			elsif integer_array.length == 2
				if integer_array[1].to_i != 0
					print (@hash[integer_array[0].to_i * 10].to_s + @hash[integer_array[1].to_i].to_s) << "Dollars"
				else
					print (@hash[integer_array[0].to_i * 10].to_s) << "Dollars"
				end
			elsif integer_array.length == 3
				print @hash[integer_array[0].to_i].to_s + @hash[100] + @hash[integer_array[1].to_i * 10].to_s + @hash[integer_array[2].to_i].to_s << "Dollers"
			elsif integer_array.length == 4
				print @hash[integer_array[0].to_i].to_s + @hash[1000] + @hash[integer_array[1].to_i].to_s+ @hash[100] + @hash[integer_array[2].to_i * 10 ].to_s + @hash[integer_array[3].to_i].to_s << "Dollers"
			elsif integer_array.length == 5
				print (@hash[integer_array[0].to_i * 10 ].to_s + @hash[integer_array[1].to_i].to_s) + @hash[1000] + @hash[integer_array[2].to_i].to_s + @hash[100] + @hash[integer_array[3].to_i * 10 ] + @hash[integer_array[4].to_i] + "Dollers"
            else
               puts " the number is too large"
            end
		end	    
	end	
end	
file = ARGV[0]
hash = {0=>"zero",1=>"one",2=>"two",3=>"three",4=>"four",5=>"five",6=>"six",7=>"seven",8=>"eight",9=>"nine",10=>"ten",
		11=>"eleven",12=>"twelve",13=>"thirteen",14=>"forteen",15=>"fifteen",16=>"sixteen",17=>"seventeen",18=>"eighteen",19=>"ninteen",
		20=>"twenty",30=>"thirty",40=>"forty",50=>"fifty",60=>"sixty",70=>"seventy",80=>"eighty",90=>"ninty",100=>"hundred",1000=>"thousand" ,1000000000=>"onemillion"}
text_dollar = TextDollar.new hash
text_dollar.text_dollar file

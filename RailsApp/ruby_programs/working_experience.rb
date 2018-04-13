class WorkExperience
	def get_work_experience file_name
		begin
			File.open(file_name, "r") do |data|
				while line_data = data.gets
					if line_data.length > 1
						dates = line_data.split(';').map! {|x| x.split('-')}
						ranges = get_ranges(dates)
						puts ranges.length/365
					else
						puts "line is empty"
					end
				end
			end
		rescue Exception => e
			puts e.message
		end	
	end
	
	def get_ranges(dates)
		require 'Set'
		puts require 'date'
		ranges = Set.new
		dates.each do |date_range|
			start = Date.parse(date_range[0])
			finish = (Date.parse(date_range[1]) >> 1) - 1
			date = (start..finish)
			ranges.merge(date)
		end
		ranges
	end
end
file = ARGV[0]
work_experience = WorkExperience.new
work_experience.get_work_experience file

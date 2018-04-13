class Program < ApplicationRecord
	attr_accessor :status, :program_id, :offset, :code, :programname, :programdescription
	
	has_many :programhistories
	validates :program_description, presence: true
	validates :program_name, :uniqueness => true, presence: true, on: :new
	
	def execution(program, programhistory)
		open('input.txt','w') { |file| file.write("#{programhistory.input}") }
		 programhistory.system_output = `ruby ruby_programs/#{program.program_name.downcase.tr(" ", "_")}.rb input.txt`	
		 Programhistory.create(input: programhistory.input, ip_address: programhistory.ip_address,  output: programhistory.system_output, status: "#{$?.success?}", program_id: program.id).valid? 
		if programhistory.output.eql? programhistory.system_output
			programhistory.status = true
		else 
			programhistory.status = false
		end		
		return programhistory
	end

	def add(program)
		program.save
		p program
		File.open("ruby_programs/#{program.program_name.downcase.gsub(" ","_")}.rb", "w") {|f| f.write("#{program.code}") }
	end
	
	def updates(program, current_user)
		File.delete("ruby_programs/#{program.program_name.downcase.gsub(" ","_")}.rb") if program.programname.nil? == false
		program.update(program_name: program.programname, program_description: program.programdescription, author: current_user.name)	
		File.open("ruby_programs/#{program.programname.downcase.gsub(" ","_")}.rb","w") { |f| f << "#{program.code}"} 
		return program
	end
	  
	  

	
		
end

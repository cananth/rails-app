class ProgramController < ApplicationController
	
	def index
		p params
		p @program = Program.limit(7).offset(params[:offset]).order(program_name: 'asc')
		p @program[0].offset = params[:offset]
		
		
	end
	
	def search
		 @program_data = Program.search(params[:search], star: true)
         render :search
	end
	
	def show
		session[:previous_url] = request.url
		@program = Program.find_by(id: params[:id])
		session[:program_id],  = @program.id
	end
	
	def execute
		@program, @programhistory, @programhistory.input, @programhistory.output, @programhistory.ip_address  = Program.find_by(id: session[:program_id]),  Programhistory.all.first, params[:input], params[:output], request.remote_ip
		if current_user.nil?
			authenticate_user!
		else
			p @programhistory = @program.execution(@program, @programhistory)
			@program = Program.find_by(id: session[:program_id])
			 if @programhistory.output.nil? or @programhistory.output.empty?
				render 'program/show' 
			 else 
				render 'program/compare' 
			end
	    end
	end
		
	def add_program
		 
	end
	
	def create
		@program, @program.code =  Program.new(program_name: params[:programname], program_description: params[:description], author: @user.username), params[:code]
		if @program.valid?
			@program.add(@program)
			redirect_to root_path, flash: {notice: "Program Added Successfully "}
		else 
			render 'program/add_program'
		end	
	end
	
	def update_program
		 @program =  Program.find_by(id: session[:program_id])
		 @code = File.open("ruby_programs/#{@program.program_name.downcase.gsub(" ","_")}.rb","r").read
	end
	
	def update
		 @program, @program.programname, @program.programdescription, @program.code =  Program.find_by(id: session[:program_id]), params[:name], params[:Description], params[:code]
		@program = @program.updates(@program, current_user)
		redirect_to({:controller => 'program', :action => 'show', :id  => session[:program_id]}, flash: {notice: "Program Updated Successfully "})
	end
	
	def destroy
		File.delete("ruby_programs/#{Program.find_by(id: session[:program_id])[:program_name].downcase.gsub(" ","_")}.rb")
		Program.find_by(id: session[:program_id]).destroy
		redirect_to root_path, flash: {notice: "Program is  deleted"}
	end

end


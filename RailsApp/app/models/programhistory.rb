class Programhistory < ApplicationRecord
	validates  :input,  :ip_address, :status, presence: true
    attr_accessor :system_output, :status
	def  self.pdf(current_user, program)
		index = 1 
		count = 0
		@programhistory = Programhistory.where(program_id: program.id).order(id: :desc)
		Prawn::Document.generate("#{program.program_name}history.pdf", :page_size => 'A3', :Background => "#{Rails.root.to_s}/app/assets/images/mahaswami.png") do |pdf| 
		pdf.text "PROGRAM NAME:#{program.program_name}", :align => :center, :size => 20
		pdf.text "DOWNLOADED BY : #{current_user.name}   DOWLOADED TIME : #{Time.now.utc.localtime("+05:30").strftime("%I:%M %p")}  DOWNLOADED DATE : #{Time.now.utc.localtime("+05:30").strftime("%Y-%m-%d")}", :size => 10, :align => :center, :padding => 7
		table_content = [["SERIAL NUMBER", "PROGRAM NAME","INPUT","OUTPUT","TIME","DATE","IP","STATUS"]]
		@programhistory.each do |row|
			table_content.push(["#{index}","#{program.program_name}","#{row['input']}","#{row['output']}","#{row['created_at'].localtime("+05:30").strftime("%I:%M %p")}","#{row['created_at'].to_date}","#{row['ip_address']}","#{row['status']}"])
				 index = index + 1
			 end 
			 pdf.table(table_content, :position => :center) do
				 while (count <= table_content.length) do
					 row(0).style(:background_color => 'dddddd')
					 row(0..count).style(:size => 9, :width => 90)
					 row(0..count).column(0..7).style(:align => :center)
					 row(count + 1).style(:background_color => 'F0F0A3')
					 count = count + 2
				 end
			 end
			 pdf.page_count.times do |i|
					pdf.go_to_page i
					pdf.transparent(0.3, 0.75) do
						bg_image = "#{Rails.root.to_s}/app/assets/images/mahaswami.png"	
						pdf.image bg_image, :width => 600
						pdf.move_up 500
					end	
			end	
		 end			
	end
end

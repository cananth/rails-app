class Loginhistory < ApplicationRecord

	validates :user_id, :ip_address, presence: true
	
	def self.pdf(current_user, ip)
		index = 1
		count = 0
		@loginhistory = Loginhistory.where(user_id: current_user.id).order(id: :desc)
		Prawn::Document.generate("#{current_user.name}history.pdf", :page_size => 'A4', ) do |pdf| 
			pdf.text "USERNAME LOGIN HISTORY:#{current_user.name}", :align => :center, :size => 20
			pdf.text "DOWNLOADED BY : #{current_user.name}   DOWLOADED TIME : #{Time.now.utc.localtime("+05:30").strftime("%I:%M %p")}  DOWNLOADED DATE : #{Time.now.utc.localtime("+05:30").strftime("%Y-%m-%d")}", :size => 10, :align => :center, :padding => 7
			table_content = [["SERIAL NUMBER", "TIME","DATE","IP"]]
				@loginhistory.each do |row|
					table_content.push(["#{index}","#{row['created_at'].localtime("+05:30").strftime("%I:%M %p")}","#{row['created_at'].to_date}","#{row['ip_address']}"])
					index = index + 1
				end
				pdf.table(table_content,  :position => :center) do
					
					while (count <= table_content.length) do
						row(0).style(:background_color => 'dddddd', :align => :center)
						row(0..count).column(0..3).style(:size => 15, :padding => 7)
						row(0..count).column(0..3).style(:align => :center)
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
	


require "pg"
class Connection
	def initialize conn
		@conn = conn
	end
	
	def menu
		begin
			operations = ["1. Select", "2. Insert", "3. Update", "4. Delete", "5.list of Databases", "6.list of Tables", "7.CreateTable","8.Alter","9.Drop"]
			puts operations
			puts "enter  your choice of operation"
			value = gets.to_i
			select if value == 1
			insert if value == 2
			update if value == 3
			delete if value == 4
			list_database if value == 5
			list_tables if value == 6
			create if value == 7
			alter if value == 8
			drop if value == 9
			puts "do u want to continue, press Y/N"
			answer = gets.chomp
		end while answer == 'Y' or answer == 'y'
	end		
	
	def select
		 puts "enter the table name"
		 data = gets.chomp
		 res = @conn.exec "select * from #{data}"
		 puts "the #{data} database"
		 columns = res.fields
		 print columns[0], "	" ,columns[1],"		" ,columns[2],"		",columns[3],"		",columns[4]
		 puts "---------------------------------------------------"
		 res.each do |row|
			puts "%s\t%s \t%s \t%s\t%s\t%s"% [row["#{columns[0]}"], row["#{columns[1]}"], row["#{columns[2]}"], row["#{columns[3]}"] , row["#{columns[4]}"], row["#{columns[5]}"] ]
		  end
	end
		  			
	def insert
		res1 = @conn.exec("SELECT * FROM pg_tables where schemaname = 'public'")
		puts " table_name     table_owner"
		res1.each do |row|
			puts "%s\t\t%s" % [row['tablename'], row['tableowner']]
		end	 
		puts "enter the table name for checking the datatype of the columns"
		table = gets.chomp 
		res = @conn.exec("select column_name, data_type from information_schema.columns where table_name = '#{table}'")
		print res.fields
		puts "------------------------------------------------"
		res.each do |row|
			puts "%s\t\t%s" % [row['column_name'], row['data_type'] ]
		end	
		
		 res = @conn.exec "select * from #{table}"
		 columns = res.fields
		puts "plz enter the data for the rows respectively"
		@conn.prepare('statement1', "insert into #{table} (#{columns[0]}, #{columns[1]}, #{columns[2]}, #{columns[3]}, #{columns[4]}  ) values ($1, $2, $3, $4, $5)")
		@conn.exec_prepared('statement1', [ gets.chomp, gets.chomp, gets.chomp, gets.chomp, gets.chomp ])
	end	
	
	 def update
		 puts "enter the table name to update"
		 table_name = gets.chomp
		 res = @conn.exec "select * from #{table_name}"
		 puts"---------------------------------------"
		 puts "the #{table_name} database is"
		 puts "---------------------------------------------------"
		 columns = res.fields
		 print columns[0], "	" ,columns[1],"		" ,columns[2],"		",columns[3],"		",columns[4]
		 puts "---------------------------------------------------"
		 res.each do |row|
			puts "%s\t%s \t%s \t%s\t%s\t%s"% [row["#{columns[0]}"], row["#{columns[1]}"], row["#{columns[2]}"], row["#{columns[3]}"] , row["#{columns[4]}"], row["#{columns[5]}"] ]
		  end
		 puts "plz give the row name which is to be updated"	
			data = gets.chomp
		 puts "plz give the row name for which condition should b applied"
			data1 = gets.chomp
		 puts "plz the values with respect to the rows"
		 @conn.prepare('statement1', "update	employee set #{data} = $1 where #{data1} = $2")
		 @conn.exec_prepared('statement1', [gets.chomp, gets.chomp])
		 puts "updatation is done succesfully" 
			
	end
	
	def  delete
		puts "enter the table name for deletion"
		table_name = gets.chomp
		 res = @conn.exec "select * from #{table_name}"
		 puts"---------------------------------------"
		 puts "the employee database is"
		 puts "---------------------------------------------------"
		 columns = res.fields
		 print columns[0], "	" ,columns[1],"		" ,columns[2],"		",columns[3],"		",columns[4]
		 puts "---------------------------------------------------"
		 res.each do |row|
			puts "%s\t%s \t%s \t%s\t%s\t%s"% [row["#{columns[0]}"], row["#{columns[1]}"], row["#{columns[2]}"], row["#{columns[3]}"] , row["#{columns[4]}"], row["#{columns[5]}"] ]
		  end		 
		  puts "enter the row name to be deleted"
		 data = gets.chomp
		 puts "plz give the value for the row"
			conn.prepare('statement1', "delete from #{table_name} where #{data} = $1")
			conn.exec_prepared('statement1', [ gets.chomp])
	
	end
		 
	def list_database
	   res = conn.exec "SELECT * FROM pg_database"
	   puts " all the databases"
	   puts "-----------------"
	   res.each do |row|
			puts "%s" % [row ['datname']]
		end	
	end
		
	def list_tables
		res = @conn.exec("SELECT * FROM pg_tables where schemaname = 'public'")
		puts " table_name     table_owner"
		res.each do |row|
			puts "%s\t\t%s" % [row['tablename'], row['tableowner']]
		end	
	end	
	
	def create
		puts "give the table name to be created"
		table_name = gets.chomp
		puts "enter the 4 column name after this line"
		 data1 = gets.chomp
		 data2 = gets.chomp
		 data3 = gets.chomp
		 data4 = gets.chomp
	   	conn.prepare('statement1',"create table #{table_name}(#{data1} char(40), #{data2} char(40), #{data3} char(50), #{data4} char(50) )")
		conn.exec_prepared('statement1')
	end
		
	def alter
		list_tables
	    puts "enter the table name where alter should be done"
	    table_name = gets.chomp
	    puts "table name are"
	     res = @conn.exec "select * from #{table_name}"
	     puts res.fields
		puts "enter the old column name and new column name for renaming the column name"
		old_name = gets.chomp
		new_name = gets.chomp
		@conn.prepare('statement',"alter table #{table_name} rename #{old_name} to #{new_name}")		
		@conn.exec_prepared('statement')  
	end
		
	def drop
		list_tables
		puts "please enter the table name from the above list of tables"
		table_name = gets.chomp
		@conn.prepare('statement',"drop table #{table_name}")
		@conn.exec_prepared('statement')	
	end
		
end	
conn = PG.connect(:dbname => 'mahaswami',:user => 'postgres', :password =>'postgres')
connection = Connection.new conn
connection.menu

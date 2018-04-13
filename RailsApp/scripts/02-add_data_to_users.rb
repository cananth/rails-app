require 'pg'
class Insert
	def insert_operation
			conn = PG.connect(:dbname => 'rails_db',:user => 'postgres', :password =>'postgres')
			conn.prepare('state',"insert into users (username, password, email) values ('ananth' , 'ananth','ananth@email.com')")
			conn.exec_prepared('state',)
			conn.exec("DEALLOCATE state")
	end
end
insert_data = Insert.new 
insert_data.insert_operation

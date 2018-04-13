class CreateLoginhistories < ActiveRecord::Migration[5.1]
  def change
    create_table :loginhistories do |t|
	  t.integer :user_id
	  t.string :ip_address
	  t.string :time
	  t.string :date
      t.timestamps
    end
    
  end
end

class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
	  t.string :program_name
	  t.text :program_description
	  t.text :author
      t.timestamps
    end
  end
end

class CreateProgramhistories < ActiveRecord::Migration[5.1]
  def change
    create_table :programhistories do |t|
	  t.integer :program_id
	  t.text :output
	  t.text :input
	  t.string :status
      t.timestamps
    end
		add_foreign_key :programhistories, :programs, column: :program_id
  end
end

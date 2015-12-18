class CreateTodos < ActiveRecord::Migration

	def change
		create_table :todos do |t|
			t.string :todo, :null => false
			t.string :completed, :null => false, :default => 'not completed'
			t.timestamps :created_at, :null => false
			t.timestamps :updated_at, :null => false
		end
	end
end
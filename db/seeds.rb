require 'faker'
class Todo < ActiveRecord::Base

	def self.create(task)
		Todo.create(:todo, "#{task}")
	end
end

todos = ["Move with Lil to the black mountain hills of Dakota",
"Lose Lil to Danny",
"Get hit in the eye by Danny",
"Walk into town seeking revenge",
"Book room at local saloon",
"Check into room and read Gideon's bible",
"Drink too much gin",
"Overhear Lil and Danny in neighboring room",
"Burst into neighboring room and declare a showdown",
"Get shot by Danny and collapse in corner",
"Visit doctor",
"Return to room and read Gideon's bible",
"Sing along! D'do d'do d'do do do d'do d'do d'do"]

todos.each do |todo|
	Todo.create(todo)
end

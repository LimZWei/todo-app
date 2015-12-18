require_relative 'config/application'

class Todo < ActiveRecord::Base

	def self.add(task)
		Todo.create(todo: "#{task}")
		puts "Appended '#{task}' to your TODO list..." 
	end

	def self.delete(id)
		puts "Deleted '#{Todo.find(id).todo}' from your TODO list..."
		Todo.find(id).destroy
	end

	def self.complete(id)
		Todo.find(id).update(completed: "completed")
	end

	def self.list

		array = Todo.all
		puts '-'*120
		print '|' + 'id'.ljust(3) + '|' 
		print 'TODO'.ljust(40) + '|' 
		print 'completed'.ljust(20) + '|' 
		print 'created_at'.ljust(25) + '|' 
		puts 'updated_at'.ljust(26) +'|'
		puts '-'*120
		array.each do |t|
			print '|' +(t.id).to_s + ('.').ljust(2) +'|' 
			print (t.todo).ljust(40) + '|'
			print (t.completed.to_s).ljust(20) + '|'
			print (t.created_at.to_s).ljust(25) + '|'
			puts t.updated_at.to_s.ljust(26) + '|'
		end
		puts '-'*120
	end

	def self.instruction
		puts "(enter 'add <task>' to add a task)"
		puts "(enter 'delete <task_id>' to delete a task)"
		puts "(enter 'complete <task_id>' when a task is completed)"
		puts "(enter 'list' to list all tasks)"
		puts "(enter '*controls' for all instructions"
	end

end


input = ARGV
case ARGV[0]
when "add"
	Todo.add(ARGV[1..-1].join(" "))
when "delete"
	Todo.delete(ARGV[1])
when "complete"
	Todo.complete(ARGV[1])
when "list"
	Todo.list
else 
	Todo.instruction
end

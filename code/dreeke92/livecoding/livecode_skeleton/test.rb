
require "sqlite3"
require_relative 'task'

db_file_path = File.join(File.dirname(__FILE__), "tasks.db")
DB = SQLite3::Database.new(db_file_path)
DB.results_as_hash = true

# above lines must be kept

# TODO: CRUD some tasks to test it !
# Here is an example:
task = Task.new(title: "code", description: "HELOO", done: false)
task.save
task = Task.new(title: "code", description: "KOEKOEK", done: false)
task.save
task = Task.new(title: "code", description: "IM HERE", done: true)
task.save
task = Task.new(title: "code", description: "IM HERE TOO", done: true)
task.save
task = Task.new(title: "code", description: "IM NOT HERE", done: true)
task.save
puts task
puts Task.all

task.destroy

# GENERAL KNOWLEDGE:
# 1. We only get back strings and integers from the DB. It is our job to convert those elements back into ruby objects with the correct data types.


class Task
# Let's build a Task class capable of CRUD against a SQL table tasks.

  attr_accessor :id, :title, :description, :done
  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:description]
    @done = attributes[:done]
  end

  def self.find(id)
    request = <<-SQL
      SELECT * FROM tasks WHERE id = "#{id}"
    SQL
    DB.results_as_hash = true
    result_hash = DB.execute(request)[0]
    if result_hash.nil?
      nil
    else
      if result_hash[:done] == "1"
        Task.new(id: result_hash['id'], title: result_hash['title'], description: result_hash['description'], done: true)
      else
        Task.new(id: result_hash['id'], title: result_hash['title'], description: result_hash['description'], done: false)
      end
    end
  end

  def self.all
    request = <<-SQL
      SELECT *
      FROM tasks
    SQL
    DB.results_as_hash = true
    result = DB.execute(request)
    result.map do |element|
      if element[:done] == "1"
        Task.new(id: element['id'], title: element['title'], description: element['description'], done: true)
      else
        Task.new(id: element['id'], title: element['title'], description: element['description'], done: false)
      end
    end
  end

  def destroy
    # TODO: destroy the current instance from the database
    request = <<-SQL
      DELETE FROM tasks
      WHERE id = "#{@id}"
    SQL
    DB.execute(request)
  end

  def save
    if @done == true
      query_new = <<-SQL
      INSERT INTO tasks (title, description, done)
      VALUES ("#{@title}", "#{@description}", "1")
      SQL
      query_existing = <<-SQL
      UPDATE tasks SET title = "#{@title}", description = "#{@description}", done = "1"
      WHERE id = "#{@id}"
      SQL
      if @id.nil?
        DB.execute(query_new)
        @id = DB.last_insert_row_id
      else
        DB.execute(query_existing)
      end
    else
      query_new = <<-SQL
      INSERT INTO tasks (title, description, done)
      VALUES ("#{@title}", "#{@description}", "0")
      SQL
      query_existing = <<-SQL
      UPDATE tasks SET title = "#{@title}", description = "#{@description}", done = "0"
      WHERE id = "#{@id}"
      SQL
      if @id.nil?
        DB.execute(query_new)
        @id = DB.last_insert_row_id
      else
        DB.execute(query_existing)
      end
    end
  end
end

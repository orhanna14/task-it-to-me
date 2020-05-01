require_relative "text_formatting"

class TaskPrinter
  attr_accessor :stdout, :text_format

  def initialize(stdout)
    @stdout = stdout
    @text_format = TextFormatting.new
  end

  def task(task)
    stdout.puts("  #{task}")
  end

  def does_not_exist(task_name)
    stdout.puts text_format.alert("Task doesn't exist: '#{task_name.strip}'")
  end

  def created(task_name)
    stdout.puts text_format.success("Created task: '#{task_name}'")
  end

  def editing_task(name)
    stdout.puts text_format.success("Editing task: '#{name}'")
  end

  def changed_task_name(name, new_name)
    stdout.puts text_format.success("Changed task name from '#{name}' to '#{new_name}'")
  end

  def no_tasks_created(project_name)
    stdout.puts text_format.alert("No tasks created in '#{project_name}'")
  end

  def no_tasks_created_in_current_project(current_project)
    stdout.puts text_format.alert("No tasks created in '#{current_project.keys.first}'")
  end

  def deleted(task_name)
    stdout.puts text_format.success("Deleted task: '#{task_name.strip}'")
  end

  def finished(task_name)
    stdout.puts text_format.success("Finished task: '#{task_name.strip}'")
  end

  def list_of_tasks
    stdout.puts text_format.success("Listing tasks:")
  end

  def double_line
    stdout.puts("\n\n")
  end
end
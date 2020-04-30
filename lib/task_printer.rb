require_relative "font_color_and_style"

class TaskPrinter
  attr_accessor :stdout, :colors

  def initialize(stdout)
    @stdout = stdout
    @colors = FontColorAndStyle.new
  end

  def task(task)
    stdout.puts("  #{task}")
  end

  def does_not_exist(task_name)
    stdout.puts colors.orange + ("Task doesn't exist: '#{task_name.strip}'") + colors.escape
  end

  def created(task_name)
    stdout.puts colors.green + ("Created task: '#{task_name}'") + colors.escape
  end

  def editing_task(name)
    stdout.puts colors.green + ("Editing task: '#{name}'") + colors.escape
  end

  def changed_task_name(name, new_name)
    stdout.puts colors.green + ("Changed task name from '#{name}' to '#{new_name}'") + colors.escape
  end

  def no_tasks_created(project_name)
    stdout.puts colors.orange + ("No tasks created in '#{project_name}'") + colors.escape
  end

  def no_tasks_created_in_current_project(current_project)
    stdout.puts colors.orange + ("No tasks created in '#{current_project.keys.first}'") + colors.escape
  end

  def deleted(task_name)
    stdout.puts colors.green + ("Deleted task: '#{task_name.strip}'") + colors.escape
  end

  def finished(task_name)
    stdout.puts colors.green + ("Finished task: '#{task_name.strip}'") + colors.escape
  end

  def list_of_tasks
    stdout.puts colors.green + ("Listing tasks:") + colors.escape
  end

  def double_line
    stdout.puts("\n\n")
  end
end
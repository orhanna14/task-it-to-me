class TaskPrinter
  attr_accessor :stdout

  def initialize(stdout)
    @stdout = stdout
  end

  def task(task)
    stdout.puts("  #{task}")
  end

  def does_not_exist(task_name)
    stdout.puts("\e[40;38;5;214mTask doesn't exist:\e[0m '#{task_name.strip}'\n\n")
  end

  def created(task_name)
    stdout.puts("\e[38;5;40mCreated task:\e[0m '#{task_name}'\n\n")
  end

  def editing_task(name)
    stdout.puts("\e[38;5;40mEditing task:\e[0m '#{name}'")
  end

  def changed_task_name(name, new_name)
    stdout.puts("\e[38;5;40mChanged task name from\e[0m '#{name}' \e[38;5;40mto\e[0m '#{new_name}'\n\n")
  end

  def no_tasks_created(project_name)
    stdout.puts("\e[40;38;5;214mNo tasks created in '#{project_name}'\e[0m\n\n")
  end

  def no_tasks_created_in_current_project(current_project)
    stdout.puts("\e[40;38;5;214mNo tasks created in \e[0m'#{current_project.keys.first}'\n\n")
  end

  def deleted(task_name)
    stdout.puts("\e[38;5;40mDeleted task:\e[0m '#{task_name.strip}'\n\n")
  end

  def finished(task_name)
    stdout.puts("\e[38;5;40mFinished task:\e[0m '#{task_name.strip}'\n\n")
  end

  def list_of_tasks
    stdout.puts("\e[38;5;40mListing tasks:\e[0m")
  end

  def double_line
    stdout.puts("\n\n")
  end
end
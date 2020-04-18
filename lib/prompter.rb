class Prompter
  attr_reader :stdout

  def initialize(stdout)
    @stdout = stdout
  end

  def project_name
    stdout.puts("\e[0;3mEnter a project name:\e[0m")
  end

  def new_project_name
    stdout.puts("\e[0;35mEnter new project name:\e[0m")
  end

  def new_task_name
    stdout.puts("\e[0;35mEnter a task name:\e[0m")
  end

  def existing_task_name
    stdout.puts("\e[0;35mEnter task name:\e[0m")
  end
end
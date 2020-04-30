require_relative "font_color_and_style"

class Prompter
  attr_reader :stdout, :style

  def initialize(stdout)
    @stdout = stdout
    @style = FontColorAndStyle.new
  end

  def project_name
    stdout.puts style.italics + ("Enter a project name:") + style.escape
  end

  def new_project_name
    stdout.puts style.italics + ("Enter new project name:") + style.escape
  end

  def new_task_name
    stdout.puts style.italics + ("Enter a task name:") + style.escape
  end

  def existing_task_name
    stdout.puts style.italics + ("Enter task name:") + style.escape
  end
end
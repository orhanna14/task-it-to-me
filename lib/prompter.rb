require_relative "text_formatting"

class Prompter
  attr_reader :stdout, :text_format

  def initialize(stdout)
    @stdout = stdout
    @text_format = TextFormatting.new
  end

  def project_name
    stdout.puts text_format.emphasis("Enter a project name:")
  end

  def new_project_name
    stdout.puts text_format.emphasis("Enter new project name:")
  end

  def new_task_name
    stdout.puts text_format.emphasis("Enter a task name:")
  end

  def existing_task_name
    stdout.puts text_format.emphasis("Enter task name:")
  end
end
require_relative "text_formatting"

class MenuPrinter
  attr_accessor :stdout, :text_format

  def initialize(stdout)
    @stdout = stdout
    @text_format = TextFormatting.new
  end
  
  def project_menu
    stdout.puts text_format.success("Welcome to Taskitome!")
    stdout.puts text_format.default("=============================")
    stdout.puts ("PROJECTS MENU")
    stdout.puts text_format.default("-----------------------------")
    stdout.puts text_format.prompt("ENTER A COMMAND:")
    stdout.puts text_format.menu_item("a ", "  Add a new project")
    stdout.puts text_format.menu_item("ls ", " List all projects")
    stdout.puts text_format.menu_item("d ", "  Delete a project")
    stdout.puts text_format.menu_item("e ", "  Edit a project")
    stdout.puts text_format.menu_item("q ", "  Quit the app")
  end

  def edit_project_menu(name)
    stdout.puts text_format.success("Editing project: '#{name}'")
    stdout.puts text_format.default("EDIT PROJECT MENU")
    stdout.puts("-----------------------------")
    stdout.puts text_format.prompt("ENTER A COMMAND:")
    stdout.puts text_format.menu_item("c ", "  Change the project name")
    stdout.puts text_format.menu_item("a ", "  Add a new task")
    stdout.puts text_format.menu_item("ls ", " List all tasks")
    stdout.puts text_format.menu_item("d ", "  Delete a task")
    stdout.puts text_format.menu_item("e ", "  Edit a task")
    stdout.puts text_format.menu_item("f ", "  Finish a task")
    stdout.puts text_format.menu_item("b ", "  Back to Projects menu")
    stdout.puts text_format.menu_item("q ", "  Quit the app")
  end
end
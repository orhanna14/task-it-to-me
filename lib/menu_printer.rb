require_relative "font_color_and_style"

class MenuPrinter
  attr_accessor :stdout, :colors

  def initialize(stdout)
    @stdout = stdout
    @colors = FontColorAndStyle.new
  end
  
  def project_menu
    stdout.puts colors.success("Welcome to Taskitome!")
    stdout.puts colors.default("=============================")
    stdout.puts ("PROJECTS MENU")
    stdout.puts colors.default("-----------------------------")
    stdout.puts colors.alert("ENTER A COMMAND:")
    stdout.puts colors.default("a ") + colors.options("  Add a new project")
    stdout.puts colors.default("ls ")  + colors.options(" List all project")
    stdout.puts colors.default("d ") + colors.options("  Delete a project")
    stdout.puts colors.default("e ") + colors.options("  Edit a project")
    stdout.puts colors.default("q ")  + colors.options("  Quit the app")
  end

  def edit_project_menu(name)
    stdout.puts colors.success("Editing project: '#{name}'")
    stdout.puts colors.default("EDIT PROJECT MENU")
    stdout.puts("-----------------------------")
    stdout.puts colors.alert("ENTER A COMMAND:")
    stdout.puts colors.default("c ") + colors.options("  Change the project name")
    stdout.puts colors.default("a ") + colors.options("  Add a new task")
    stdout.puts colors.default("ls ") + colors.options(" List all tasks")
    stdout.puts colors.default("d ")  + colors.options("  Delete a task")
    stdout.puts colors.default("e ") + colors.options("  Edit a task")
    stdout.puts colors.default("f ")  + colors.options("  Finish a task")
    stdout.puts colors.default("b ")  + colors.options("  Back to Projects menu")
    stdout.puts colors.default("q ")  + colors.options("  Quit the app")
  end
end
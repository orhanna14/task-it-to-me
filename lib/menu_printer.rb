require_relative "font_color_and_style"

class MenuPrinter
  attr_accessor :stdout, :colors

  def initialize(stdout)
    @stdout = stdout
    @colors = FontColorAndStyle.new
  end
  
  def project_menu
    stdout.puts colors.green("Welcome to Taskitome!")
    stdout.puts colors.white("=============================")
    stdout.puts ("PROJECTS MENU")
    stdout.puts colors.white("-----------------------------")
    stdout.puts colors.orange("ENTER A COMMAND:")
    stdout.puts colors.white("a ") + colors.magenta("  Add a new project")
    stdout.puts colors.white("ls ")  + colors.magenta(" List all project")
    stdout.puts colors.white("d ") + colors.magenta("  Delete a project")
    stdout.puts colors.white("e ") + colors.magenta("  Edit a project")
    stdout.puts colors.white("q ")  + colors.magenta("  Quit the app")
  end

  def edit_project_menu(name)
    stdout.puts colors.green("Editing project: '#{name}'")
    stdout.puts colors.white("EDIT PROJECT MENU")
    stdout.puts("-----------------------------")
    stdout.puts colors.orange("ENTER A COMMAND:")
    stdout.puts colors.white("c ") + colors.magenta("  Change the project name")
    stdout.puts colors.white("a ") + colors.magenta("  Add a new task")
    stdout.puts colors.white("ls ") + colors.magenta(" List all tasks")
    stdout.puts colors.white("d ")  + colors.magenta("  Delete a task")
    stdout.puts colors.white("e ") + colors.magenta("  Edit a task")
    stdout.puts colors.white("f ")  + colors.magenta("  Finish a task")
    stdout.puts colors.white("b ")  + colors.magenta("  Back to Projects menu")
    stdout.puts colors.white("q ")  + colors.magenta("  Quit the app")
  end
end
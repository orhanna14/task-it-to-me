class MenuPrinter
  attr_accessor :stdout

  def initialize(stdout)
    @stdout = stdout
  end
  
  def project_menu
    stdout.puts("\e[38;5;40mWelcome to Taskitome!")
    stdout.puts("\e[0;37m=============================\n")
    stdout.puts("\e[0mPROJECTS MENU")
    stdout.puts("\e[0;37m-----------------------------")
    stdout.puts("\e[40;38;5;214mENTER A COMMAND:\e[0m")
    stdout.puts("\e[1;37ma   \e[0;35mAdd a new project")
    stdout.puts("\e[1;37mls  \e[0;35mList all project")
    stdout.puts("\e[1;37md   \e[0;35mDelete a project")
    stdout.puts("\e[1;37me   \e[0;35mEdit a project")
    stdout.puts("\e[1;37mq   \e[0;35mQuit the app\e[0m\n\n")
  end

  def edit_project_menu(name)
    stdout.puts("\e[38;5;40mEditing project: '#{name}'\n\n")
    stdout.puts("\e[0;37mEDIT PROJECT MENU\e[0m")
    stdout.puts("-----------------------------")
    stdout.puts("\e[40;38;5;214mENTER A COMMAND:\e[0m")
    stdout.puts("\e[1;37mc   \e[0;35mChange the project name")
    stdout.puts("\e[1;37ma   \e[0;35mAdd a new task")
    stdout.puts("\e[1;37mls  \e[0;35mList all tasks")
    stdout.puts("\e[1;37md   \e[0;35mDelete a task")
    stdout.puts("\e[1;37me   \e[0;35mEdit a task")
    stdout.puts("\e[1;37mf   \e[0;35mFinish a task")
    stdout.puts("\e[1;37mb   \e[0;35mBack to Projects menu")
    stdout.puts("\e[1;37mq   \e[0;35mQuit the app\e[0m\n\n")
  end
end
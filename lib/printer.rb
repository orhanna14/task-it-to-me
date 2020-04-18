class Printer
  attr_accessor :stdout

  def initialize(stdout)
    @stdout = stdout
  end

###Projects & Tasks
  #Lines
  def single_line
    stdout.puts("\n")
  end

  def double_line
    stdout.puts("\n\n")
  end
  
###Projects Only
  #Menus
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

  #With Arguments

  def projects(project)
    stdout.puts("  #{project.keys.first}\n")
  end

  def deleting_project(project_name)
    stdout.puts "\e[38;5;40mDeleting project:\e[0m '#{project_name.strip}'\n\n"
  end

  def project_does_not_exist(project_name)
    stdout.puts "\e[40;38;5;214mProject doesn't exist:\e[0m '#{project_name.strip}'\n\n"
  end

  def created_project(name)
    stdout.puts("\e[38;5;40mCreated project:\e[0m '#{name}'\n\n")
  end

  def changed_project_name(old_name, new_name)
    stdout.puts("\e[38;5;40mChanged project name from\e[0m '#{old_name}' \e[38;5;40mto\e[0m '#{new_name}'\n\n")
  end

  #Without Arguments

  def list_of_projects
    stdout.puts("\e[38;5;40mListing projects:\e[0m\n")
  end

  def no_projects_created
    stdout.puts("\e[40;38;5;214mNo projects created\e[0m\n\n")
  end

  def cannot_delete_project
    stdout.puts("\e[40;38;5;214mCan't delete a project\e[0m")
  end

  def cannot_edit_project
    stdout.puts("\e[40;38;5;214mCan't edit project\e[0m")
  end

  def cannot_edit_projects
    stdout.puts("\e[40;38;5;214mCan't edit any projects\e[0m")
  end

###Tasks Only
  #With Arguments

  def task(task)
    stdout.puts("  #{task}")
  end

  def task_does_not_exist(task_name)
    stdout.puts("\e[40;38;5;214mTask doesn't exist:\e[0m '#{task_name.strip}'\n\n")
  end

  def created_task(task_name)
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

  def deleted_task(task_name)
    stdout.puts("\e[38;5;40mDeleted task:\e[0m '#{task_name.strip}'\n\n")
  end

  def finished_task(task_name)
    stdout.puts("\e[38;5;40mFinished task:\e[0m '#{task_name.strip}'\n\n")
  end

  #Without arguments

  def list_of_tasks
    stdout.puts("\e[38;5;40mListing tasks:\e[0m")
  end
end
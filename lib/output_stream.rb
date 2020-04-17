class OutputStream
  attr_accessor :stdout

  def initialize(stdout)
    @stdout = stdout
  end

###Projects & Tasks

  def print_single_line
    stdout.puts("\n")
  end

  def print_double_line
    stdout.puts("\n\n")
  end
  
###Projects Only
  #Menus

  def print_project_menu
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

  def print_edit_project_menu(name)
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

  #Prompts

  def prompt_for_project_name
    stdout.puts("\e[0;3mEnter a project name:\e[0m")
  end

  def prompt_for_new_project_name
    stdout.puts("\e[0;35mEnter new project name:\e[0m")
  end

  #With Arguments

  def print_projects(project)
    stdout.puts("  #{project.keys.first}\n")
  end

  def print_deleting_project(project_name)
    stdout.puts "\e[38;5;40mDeleting project:\e[0m '#{project_name.strip}'\n\n"
  end

  def print_project_does_not_exist(project_name)
    stdout.puts "\e[40;38;5;214mProject doesn't exist:\e[0m '#{project_name.strip}'\n\n"
  end

  def print_created_project(name)
    stdout.puts("\e[38;5;40mCreated project:\e[0m '#{name}'\n\n")
  end

  def print_changed_project_name(old_name, new_name)
    stdout.puts("\e[38;5;40mChanged project name from\e[0m '#{old_name}' \e[38;5;40mto\e[0m '#{new_name}'\n\n")
  end

  #Without Arguments

  def print_list_of_projects
    stdout.puts("\e[38;5;40mListing projects:\e[0m\n")
  end

  def print_no_projects_created
    stdout.puts("\e[40;38;5;214mNo projects created\e[0m\n\n")
  end

  def print_cannot_delete_project
    stdout.puts("\e[40;38;5;214mCan't delete a project\e[0m")
  end

  def print_cannot_edit_project
    stdout.puts("\e[40;38;5;214mCan't edit project\e[0m")
  end

  def print_cannot_edit_projects
    stdout.puts("\e[40;38;5;214mCan't edit any projects\e[0m")
  end

###Tasks Only
  #Prompts

  def prompt_for_new_task_name
    stdout.puts("\e[0;35mEnter a task name:\e[0m")
  end

  def prompt_for_existing_task_name
    stdout.puts("\e[0;35mEnter task name:\e[0m")
  end

  #With Arguments

  def print_task(task)
    stdout.puts("  #{task}")
  end

  def print_task_does_not_exist(task_name)
    stdout.puts("\e[40;38;5;214mTask doesn't exist:\e[0m '#{task_name.strip}'\n\n")
  end

  def print_created_task(task_name)
    stdout.puts("\e[38;5;40mCreated task:\e[0m '#{task_name}'\n\n")
  end

  def print_editing_task(name)
    stdout.puts("\e[38;5;40mEditing task:\e[0m '#{name}'")
  end

  def print_changed_task_name(name, new_name)
    stdout.puts("\e[38;5;40mChanged task name from\e[0m '#{name}' \e[38;5;40mto\e[0m '#{new_name}'\n\n")
  end

  def print_no_tasks_created(project_name)
    stdout.puts("\e[40;38;5;214mNo tasks created in '#{project_name}'\e[0m\n\n")
  end

  def print_no_tasks_created_in_current_project(current_project)
    stdout.puts("\e[40;38;5;214mNo tasks created in \e[0m'#{current_project.keys.first}'\n\n")
  end

  def print_deleted_task(task_name)
    stdout.puts("\e[38;5;40mDeleted task:\e[0m '#{task_name.strip}'\n\n")
  end

  def print_finished_task(task_name)
    stdout.puts("\e[38;5;40mFinished task:\e[0m '#{task_name.strip}'\n\n")
  end

  #Without arguments

  def print_list_of_tasks
    stdout.puts("\e[38;5;40mListing tasks:\e[0m")
  end
end
class Print < Struct.new(:output_stream)
  def projects_menu
    print_line("\e[38;5;40mWelcome to Taskitome!")
    print_line("\e[0;37m=============================\n")
    print_line("\e[0mPROJECTS MENU")
    print_line("\e[0;37m-----------------------------")
    print_line("\e[40;38;5;214mENTER A COMMAND:\e[0m")
    print_line("\e[1;37ma   \e[0;35mAdd a new project")
    print_line("\e[1;37mls  \e[0;35mList all project")
    print_line("\e[1;37md   \e[0;35mDelete a project")
    print_line("\e[1;37me   \e[0;35mEdit a project")
    print_line("\e[1;37mq   \e[0;35mQuit the app\e[0m\n\n")
  end

  def tasks_menu(project_name)
    print_line("\e[38;5;40mEditing project: '#{project_name}'\n\n")
    print_line("\e[0;37mEDIT PROJECT MENU\e[0m")
    print_line("-----------------------------")
    print_line("\e[40;38;5;214mENTER A COMMAND:\e[0m")
    print_line("\e[1;37mc   \e[0;35mChange the project name")
    print_line("\e[1;37ma   \e[0;35mAdd a new task")
    print_line("\e[1;37mls  \e[0;35mList all tasks")
    print_line("\e[1;37md   \e[0;35mDelete a task")
    print_line("\e[1;37me   \e[0;35mEdit a task")
    print_line("\e[1;37mf   \e[0;35mFinish a task")
    print_line("\e[1;37mb   \e[0;35mBack to Projects menu")
    print_line("\e[1;37mq   \e[0;35mQuit the app\e[0m\n\n")
  end

  # Assorted printing/view methods
  def break
    print_line("\n\n")
  end

  # project menu related messages, no arguments required
  def no_projects_message
    print_line("\e[40;38;5;214mNo projects created\e[0m\n\n")
  end

  def project_name_prompt
    print_line(
      format("Enter a project name:", :description)
    )
  end

  def new_project_name_prompt
    print_line("\e[0;35mEnter new project name:\e[0m")
  end

  def listing_project_header
    print_line("\e[38;5;40mListing projects:\e[0m\n")
  end

  def cant_delete_project
    print_line("\e[40;38;5;214mCan't delete a project\e[0m")
  end

  def cant_edit_project
    print_line("\e[40;38;5;214mCan't edit any projects\e[0m")
  end

  # project menu related messages, with data passed in
  def project_created(name)
    print_line("\e[38;5;40mCreated project:\e[0m '#{name}'\n\n")
  end

  def project_list_item(project)
    print_line("  #{project.position}.  \e[0;35m#{project.name}\e[0m\n")
  end

  def successful_delete(name)
    print_line "\e[38;5;40mDeleting project:\e[0m '#{name}'\n\n"
  end

  def project_does_not_exist(name)
    print_line "\e[40;38;5;214mProject doesn't exist:\e[0m '#{name}'\n\n"
  end

  # task menu related messages, no data passed in
  def task_name_prompt
    print_line("\e[0;35mEnter a task name:\e[0m")
  end

  def task_list_header
    print_line("\e[38;5;40mListing tasks:\e[0m")
  end

  # task menu related messages, data required
  def created_task(name)
    print_line("\e[38;5;40mCreated task:\e[0m '#{name}'\n\n")
  end

  def changed_project_name(old_name, new_name)
    print_line("\e[38;5;40mChanged project name from\e[0m '#{old_name}' \e[38;5;40mto\e[0m '#{new_name}'\n\n")
  end

  def editing_task(name)
    print_line("\e[38;5;40mEditing task:\e[0m '#{name}'")
  end

  def task_prompt
    print_line("\e[0;35mEnter a task name:\e[0m")
  end

  def changed_task_name(old_name, new_name)
    print_line("\e[38;5;40mChanged task name from\e[0m '#{old_name}' \e[38;5;40mto\e[0m '#{new_name}'\n\n")
  end

  def task_does_not_exsit(name)
    print_line("\e[40;38;5;214mTask doesn't exist:\e[0m '#{name}'\n\n")
  end

  def no_tasks_created_in(project_name)
    print_line("\e[40;38;5;214mNo tasks created in '#{project_name}'\e[0m\n\n")
  end

  def task_deleted(name)
    print_line("\e[38;5;40mDeleted task:\e[0m '#{name}'\n\n")
  end

  def finished_task(name)
    print_line("\e[38;5;40mFinished task:\e[0m '#{name}'\n\n")
  end

  def task_item(task)
    print_line("  #{task.position}.  \e[0;35m#{task.name}\e[0m")
  end

  private

  def print_line(message='')
    output_stream.puts(message)
  end

  def formatter
    Formatter.new
  end

  extend Forwardable
  def_delegators :formatter, :format
end

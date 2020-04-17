class App
  attr_reader :output_stream, :input_stream

  def initialize(output_stream, input_stream)
    @output_stream = output_stream
    @input_stream = input_stream
  end

  def run
    print_project_menu

    command = get_project_input

    while command != "q"
      if !@current_project
        case command
        when "a"
          @projects = [] if @projects.nil?
          prompt_for_project_name
          name = get_project_or_task_name
          @projects << {name => []}
          print_created_project(name)
        when "ls"
          print_list_of_projects
          if !@projects.nil? && !@projects.empty?
            @projects.each do |project|
              print_projects(project)
            end
            print_single_line
          else
            print_no_projects_created
          end
        when "d"
          if @projects && (@projects.size > 0)
            prompt_for_project_name
            project_name = get_project_or_task_name
            @deleted = @projects.delete_if { |project| project.keys.first == project_name.strip }.empty?
            if @deleted
              print_deleting_project(project_name)
            else
              print_project_does_not_exist(project_name)
            end
          end

          if !@deleted && (!@projects || @projects.empty?)
            print_cannot_delete_project
            print_no_projects_created
          end
          @deleted = nil
        when "e"
          if !@projects || @projects.size == 0
            print_cannot_edit_projects
            print_no_projects_created
            command = get_project_input
            next
          end

          prompt_for_project_name
          name = get_project_or_task_name
          if (@current_project = @projects.detect { |p| p.keys.first == name })
            print_edit_project_menu(name)
            command = get_project_input
            next
          else
            print_cannot_edit_project
            print_project_does_not_exist(name)
          end
        end
      else
        case command
        when "a"
          prompt_for_new_task_name
          task_name = get_project_or_task_name
          @current_project.values.first << task_name
          print_created_task(task_name)
        when "b"
          @current_project = false
          print_double_line
        when "c"
          prompt_for_new_project_name
          old_name = @current_project.keys.first
          new_name = get_project_or_task_name
          @current_project[new_name] = @current_project.values.first
          @current_project.delete(old_name)
          print_changed_project_name(old_name, new_name)
        when "e"
          name = get_project_or_task_name
          if (index = @current_project.values.first.find_index(name))
            print_editing_task(name)
            prompt_for_new_task_name
            new_name = get_project_or_task_name
            @current_project[@current_project.keys.first][index] = new_name
            print_changed_task_name(name, new_name)
          else
            print_task_does_not_exist(name)
          end
        when "d"
          project_name = @current_project.keys.first
          if @current_project.values.first.empty?
            print_no_tasks_created(project_name)
          else
            prompt_for_existing_task_name
            task_name = get_project_or_task_name
            if @current_project[@current_project.keys.first].delete(task_name.strip)
              print_deleted_task(task_name)
            else
              print_task_does_not_exist(task_name)
            end
          end
        when "f"
          project_name = @current_project.keys.first
          if @current_project.values.first.empty?
            print_no_tasks_created(project_name)
          else
            prompt_for_existing_task_name
            task_name = get_project_or_task_name
            if @current_project[@current_project.keys.first].delete(task_name.strip)
              print_finished_task(task_name)
            else
              print_task_does_not_exist(task_name)
            end
          end
        when "ls"
          if @current_project.values.first.empty?
            print_no_tasks_created_in_current_project(@current_project)
          else
            print_list_of_tasks
            @current_project.values.first.each do |task|
              print_task(task)
            end
            print_double_line
          end
        end
      end

      command = get_project_input
    end
  end

###Projects & Tasks

  def get_project_or_task_name
    input_stream.gets.chomp
  end

  def print_single_line
    output_stream.puts("\n")
  end

  def print_double_line
    output_stream.puts("\n\n")
  end
  
###Projects Only
  ##Input
  def get_project_input
    input_stream.gets.gsub(/\s+/, '').chomp
  end

  ##Output
    #Menus

  def print_project_menu
    output_stream.puts("\e[38;5;40mWelcome to Taskitome!")
    output_stream.puts("\e[0;37m=============================\n")
    output_stream.puts("\e[0mPROJECTS MENU")
    output_stream.puts("\e[0;37m-----------------------------")
    output_stream.puts("\e[40;38;5;214mENTER A COMMAND:\e[0m")
    output_stream.puts("\e[1;37ma   \e[0;35mAdd a new project")
    output_stream.puts("\e[1;37mls  \e[0;35mList all project")
    output_stream.puts("\e[1;37md   \e[0;35mDelete a project")
    output_stream.puts("\e[1;37me   \e[0;35mEdit a project")
    output_stream.puts("\e[1;37mq   \e[0;35mQuit the app\e[0m\n\n")
  end

  def print_edit_project_menu(name)
    output_stream.puts("\e[38;5;40mEditing project: '#{name}'\n\n")
    output_stream.puts("\e[0;37mEDIT PROJECT MENU\e[0m")
    output_stream.puts("-----------------------------")
    output_stream.puts("\e[40;38;5;214mENTER A COMMAND:\e[0m")
    output_stream.puts("\e[1;37mc   \e[0;35mChange the project name")
    output_stream.puts("\e[1;37ma   \e[0;35mAdd a new task")
    output_stream.puts("\e[1;37mls  \e[0;35mList all tasks")
    output_stream.puts("\e[1;37md   \e[0;35mDelete a task")
    output_stream.puts("\e[1;37me   \e[0;35mEdit a task")
    output_stream.puts("\e[1;37mf   \e[0;35mFinish a task")
    output_stream.puts("\e[1;37mb   \e[0;35mBack to Projects menu")
    output_stream.puts("\e[1;37mq   \e[0;35mQuit the app\e[0m\n\n")
  end

  #Prompts

  def prompt_for_project_name
    output_stream.puts("\e[0;3mEnter a project name:\e[0m")
  end

  def prompt_for_new_project_name
    output_stream.puts("\e[0;35mEnter new project name:\e[0m")
  end

  #With Arguments

  def print_projects(project)
    output_stream.puts("  #{project.keys.first}\n")
  end

  def print_deleting_project(project_name)
    output_stream.puts "\e[38;5;40mDeleting project:\e[0m '#{project_name.strip}'\n\n"
  end

  def print_project_does_not_exist(project_name)
    output_stream.puts "\e[40;38;5;214mProject doesn't exist:\e[0m '#{project_name.strip}'\n\n"
  end

  def print_created_project(name)
    output_stream.puts("\e[38;5;40mCreated project:\e[0m '#{name}'\n\n")
  end

  def print_changed_project_name(old_name, new_name)
    output_stream.puts("\e[38;5;40mChanged project name from\e[0m '#{old_name}' \e[38;5;40mto\e[0m '#{new_name}'\n\n")
  end

  #Without Arguments

  def print_list_of_projects
    output_stream.puts("\e[38;5;40mListing projects:\e[0m\n")
  end

  def print_no_projects_created
    output_stream.puts("\e[40;38;5;214mNo projects created\e[0m\n\n")
  end

  def print_cannot_delete_project
    output_stream.puts("\e[40;38;5;214mCan't delete a project\e[0m")
  end

  def print_cannot_edit_project
    output_stream.puts("\e[40;38;5;214mCan't edit project\e[0m")
  end

  def print_cannot_edit_projects
    output_stream.puts("\e[40;38;5;214mCan't edit any projects\e[0m")
  end

###Tasks Only
  ##Output
   #Prompts

  def prompt_for_new_task_name
    output_stream.puts("\e[0;35mEnter a task name:\e[0m")
  end

  def prompt_for_existing_task_name
    output_stream.puts("\e[0;35mEnter task name:\e[0m")
  end

   #With Arguments

  def print_task(task)
    output_stream.puts("  #{task}")
  end

  def print_task_does_not_exist(task_name)
    output_stream.puts("\e[40;38;5;214mTask doesn't exist:\e[0m '#{task_name.strip}'\n\n")
  end

  def print_created_task(task_name)
    output_stream.puts("\e[38;5;40mCreated task:\e[0m '#{task_name}'\n\n")
  end

  def print_editing_task(name)
    output_stream.puts("\e[38;5;40mEditing task:\e[0m '#{name}'")
  end

  def print_changed_task_name(name, new_name)
    output_stream.puts("\e[38;5;40mChanged task name from\e[0m '#{name}' \e[38;5;40mto\e[0m '#{new_name}'\n\n")
  end

  def print_no_tasks_created(project_name)
    output_stream.puts("\e[40;38;5;214mNo tasks created in '#{project_name}'\e[0m\n\n")
  end

  def print_no_tasks_created_in_current_project(current_project)
    output_stream.puts("\e[40;38;5;214mNo tasks created in \e[0m'#{current_project.keys.first}'\n\n")
  end

  def print_deleted_task(task_name)
    output_stream.puts("\e[38;5;40mDeleted task:\e[0m '#{task_name.strip}'\n\n")
  end

  def print_finished_task(task_name)
    output_stream.puts("\e[38;5;40mFinished task:\e[0m '#{task_name.strip}'\n\n")
  end

   #Without arguments

  def print_list_of_tasks
    output_stream.puts("\e[38;5;40mListing tasks:\e[0m")
  end
end
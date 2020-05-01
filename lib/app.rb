require_relative "menu_printer"
require_relative "project_printer"
require_relative "task_printer"
require_relative "prompter"
require_relative "user_input"

class App
  attr_reader :menu_printer, :project_printer, :task_printer, :user_input, :prompter, :projects

  def initialize(stdout, stdin)
    @menu_printer = MenuPrinter.new(stdout)
    @project_printer = ProjectPrinter.new(stdout)
    @task_printer = TaskPrinter.new(stdout)
    @user_input = UserInput.new(stdin)
    @prompter = Prompter.new(stdout)
    @projects = []
  end

  def add_project(name)
    projects << {name => []}
  end

  def projects_empty?
    projects.empty?
  end

  def run
    menu_printer.project_menu

    command = user_input.get_project_input

    while command != "q"
      if !@current_project
        case command
        when "a"
          prompter.project_name
          name = user_input.get_project_or_task_name
          add_project(name)
          project_printer.created(name)
        when "ls"
          project_printer.list_of_projects
          if !projects_empty?
            projects.each do |project|
              project_printer.projects(project)
            end
            project_printer.single_line
          else
            project_printer.none_created
          end
        when "d"
          if !projects_empty?
            prompter.project_name
            project_name = user_input.get_project_or_task_name
            @deleted = projects.delete_if { |project| project.keys.first == project_name.strip }.empty?
            if @deleted
              project_printer.deleting_a_project(project_name)
            else
              project_printer.does_not_exist(project_name)
            end
          end

          if !@deleted && (projects.empty?)
            project_printer.cannot_delete_a_project
            project_printer.none_created
          end
          @deleted = nil
        when "e"
          if projects_empty?
            project_printer.cannot_edit_projects
            project_printer.none_created
            command = user_input.get_project_input
            next
          end

          prompter.project_name
          name = user_input.get_project_or_task_name
          if (@current_project = @projects.detect { |p| p.keys.first == name })
          menu_printer.edit_project_menu(name)
            command = user_input.get_project_input
            next
          else
            project_printer.cannot_edit_a_project
            project_printer.does_not_exist(name)
          end
        end
      else
        case command
        when "a"
          prompter.new_task_name
          task_name = user_input.get_project_or_task_name
          @current_project.values.first << task_name
          task_printer.created(task_name)
        when "b"
          @current_project = false
          task_printer.double_line
        when "c"
          prompter.new_project_name
          old_name = @current_project.keys.first
          new_name = user_input.get_project_or_task_name
          @current_project[new_name] = @current_project.values.first
          @current_project.delete(old_name)
          project_printer.changed_name(old_name, new_name)
        when "e"
          name = user_input.get_project_or_task_name
          if (index = @current_project.values.first.find_index(name))
            task_printer.editing_task(name)
            prompter.new_task_name
            new_name = user_input.get_project_or_task_name
            @current_project[@current_project.keys.first][index] = new_name
            task_printer.changed_task_name(name, new_name)
          else
            task_printer.does_not_exist(name)
          end
        when "d"
          project_name = @current_project.keys.first
          if @current_project.values.first.empty?
            task_printer.no_tasks_created(project_name)
          else
            prompter.existing_task_name
            task_name = user_input.get_project_or_task_name
            if @current_project[@current_project.keys.first].delete(task_name.strip)
              task_printer.deleted(task_name)
            else
              task_printer.does_not_exist(task_name)
            end
          end
        when "f"
          project_name = @current_project.keys.first
          if @current_project.values.first.empty?
            task_printer.no_tasks_created(project_name)
          else
            prompter.existing_task_name
            task_name = user_input.get_project_or_task_name
            if @current_project[@current_project.keys.first].delete(task_name.strip)
              task_printer.finished(task_name)
            else
              task_printer.does_not_exist(task_name)
            end
          end
        when "ls"
          if @current_project.values.first.empty?
            task_printer.no_tasks_created_in_current_project(@current_project)
          else
            task_printer.list_of_tasks
            @current_project.values.first.each do |task|
              task_printer.task(task)
            end
            task_printer.double_line
          end
        end
      end

      command = user_input.get_project_input
    end
  end

end
require_relative "menu_printer"
require_relative "project_printer"
require_relative "task_printer"
require_relative "printer"
require_relative "prompter"
require_relative "input_stream"

class App
  attr_reader :menu_printer, :project_printer, :task_printer, :printer, :input, :prompter

  def initialize(stdout, stdin)
    @menu_printer = MenuPrinter.new(stdout)
    @project_printer = ProjectPrinter.new(stdout)
    @task_printer = TaskPrinter.new(stdout)
    @printer = Printer.new(stdout)
    @input = InputStream.new(stdin)
    @prompter = Prompter.new(stdout)
  end

  def run
    menu_printer.project_menu

    command = input.get_project_input

    while command != "q"
      if !@current_project
        case command
        when "a"
          @projects = [] if @projects.nil?
          prompter.project_name
          name = input.get_project_or_task_name
          @projects << {name => []}
          project_printer.created_project(name)
        when "ls"
          project_printer.list_of_projects
          if !@projects.nil? && !@projects.empty?
            @projects.each do |project|
              project_printer.projects(project)
            end
            printer.single_line
          else
            project_printer.no_projects_created
          end
        when "d"
          if @projects && (@projects.size > 0)
            prompter.project_name
            project_name = input.get_project_or_task_name
            @deleted = @projects.delete_if { |project| project.keys.first == project_name.strip }.empty?
            if @deleted
              project_printer.deleting_project(project_name)
            else
              project_printer.project_does_not_exist(project_name)
            end
          end

          if !@deleted && (!@projects || @projects.empty?)
            project_printer.cannot_delete_project
            project_printer.no_projects_created
          end
          @deleted = nil
        when "e"
          if !@projects || @projects.size == 0
            project_printer.cannot_edit_projects
            project_printer.no_projects_created
            command = input.get_project_input
            next
          end

          prompter.project_name
          name = input.get_project_or_task_name
          if (@current_project = @projects.detect { |p| p.keys.first == name })
          menu_printer.edit_project_menu(name)
            command = input.get_project_input
            next
          else
            project_printer.cannot_edit_project
            project_printer.project_does_not_exist(name)
          end
        end
      else
        case command
        when "a"
          prompter.new_task_name
          task_name = input.get_project_or_task_name
          @current_project.values.first << task_name
          task_printer.created_task(task_name)
        when "b"
          @current_project = false
          printer.double_line
        when "c"
          prompter.new_project_name
          old_name = @current_project.keys.first
          new_name = input.get_project_or_task_name
          @current_project[new_name] = @current_project.values.first
          @current_project.delete(old_name)
          project_printer.changed_project_name(old_name, new_name)
        when "e"
          name = input.get_project_or_task_name
          if (index = @current_project.values.first.find_index(name))
            task_printer.editing_task(name)
            prompter.new_task_name
            new_name = input.get_project_or_task_name
            @current_project[@current_project.keys.first][index] = new_name
            task_printer.changed_task_name(name, new_name)
          else
            task_printer.task_does_not_exist(name)
          end
        when "d"
          project_name = @current_project.keys.first
          if @current_project.values.first.empty?
            task_printer.no_tasks_created(project_name)
          else
            prompter.existing_task_name
            task_name = input.get_project_or_task_name
            if @current_project[@current_project.keys.first].delete(task_name.strip)
              task_printer.deleted_task(task_name)
            else
              task_printer.task_does_not_exist(task_name)
            end
          end
        when "f"
          project_name = @current_project.keys.first
          if @current_project.values.first.empty?
            task_printer.no_tasks_created(project_name)
          else
            prompter.existing_task_name
            task_name = input.get_project_or_task_name
            if @current_project[@current_project.keys.first].delete(task_name.strip)
              task_printer.finished_task(task_name)
            else
              task_printer.task_does_not_exist(task_name)
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
            printer.double_line
          end
        end
      end

      command = input.get_project_input
    end
  end

end
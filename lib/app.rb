require_relative "printer"
require_relative "prompter"
require_relative "input_stream"

class App
  attr_reader :printer, :input, :prompter

  def initialize(stdout, stdin)
    @printer = Printer.new(stdout)
    @input = InputStream.new(stdin)
    @prompter = Prompter.new(stdout)
  end

  def run
    printer.project_menu

    command = input.get_project_input

    while command != "q"
      if !@current_project
        case command
        when "a"
          @projects = [] if @projects.nil?
          prompter.project_name
          name = input.get_project_or_task_name
          @projects << {name => []}
          printer.created_project(name)
        when "ls"
          printer.list_of_projects
          if !@projects.nil? && !@projects.empty?
            @projects.each do |project|
              printer.projects(project)
            end
            printer.single_line
          else
            printer.no_projects_created
          end
        when "d"
          if @projects && (@projects.size > 0)
            prompter.project_name
            project_name = input.get_project_or_task_name
            @deleted = @projects.delete_if { |project| project.keys.first == project_name.strip }.empty?
            if @deleted
              printer.deleting_project(project_name)
            else
              printer.project_does_not_exist(project_name)
            end
          end

          if !@deleted && (!@projects || @projects.empty?)
            printer.cannot_delete_project
            printer.no_projects_created
          end
          @deleted = nil
        when "e"
          if !@projects || @projects.size == 0
            printer.cannot_edit_projects
            printer.no_projects_created
            command = input.get_project_input
            next
          end

          prompter.project_name
          name = input.get_project_or_task_name
          if (@current_project = @projects.detect { |p| p.keys.first == name })
          printer.edit_project_menu(name)
            command = input.get_project_input
            next
          else
            printer.cannot_edit_project
            printer.project_does_not_exist(name)
          end
        end
      else
        case command
        when "a"
          prompter.new_task_name
          task_name = input.get_project_or_task_name
          @current_project.values.first << task_name
          printer.created_task(task_name)
        when "b"
          @current_project = false
          printer.double_line
        when "c"
          prompter.new_project_name
          old_name = @current_project.keys.first
          new_name = input.get_project_or_task_name
          @current_project[new_name] = @current_project.values.first
          @current_project.delete(old_name)
          printer.changed_project_name(old_name, new_name)
        when "e"
          name = input.get_project_or_task_name
          if (index = @current_project.values.first.find_index(name))
            printer.editing_task(name)
            prompter.new_task_name
            new_name = input.get_project_or_task_name
            @current_project[@current_project.keys.first][index] = new_name
            printer.changed_task_name(name, new_name)
          else
            printer.task_does_not_exist(name)
          end
        when "d"
          project_name = @current_project.keys.first
          if @current_project.values.first.empty?
            printer.no_tasks_created(project_name)
          else
            prompter.existing_task_name
            task_name = input.get_project_or_task_name
            if @current_project[@current_project.keys.first].delete(task_name.strip)
              printer.deleted_task(task_name)
            else
              printer.task_does_not_exist(task_name)
            end
          end
        when "f"
          project_name = @current_project.keys.first
          if @current_project.values.first.empty?
            printer.no_tasks_created(project_name)
          else
            prompter.existing_task_name
            task_name = input.get_project_or_task_name
            if @current_project[@current_project.keys.first].delete(task_name.strip)
              printer.finished_task(task_name)
            else
              printer.task_does_not_exist(task_name)
            end
          end
        when "ls"
          if @current_project.values.first.empty?
            printer.no_tasks_created_in_current_project(@current_project)
          else
            printer.list_of_tasks
            @current_project.values.first.each do |task|
              printer.task(task)
            end
            printer.double_line
          end
        end
      end

      command = input.get_project_input
    end
  end

end
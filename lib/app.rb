require_relative "output_stream"
require_relative "input_stream"

class App
  attr_reader :output, :input

  def initialize(stdout, stdin)
    @output = OutputStream.new(stdout)
    @input = InputStream.new(stdin)
  end

  def run
    output.print_project_menu

    command = input.get_project_input

    while command != "q"
      if !@current_project
        case command
        when "a"
          @projects = [] if @projects.nil?
          output.prompt_for_project_name
          name = input.get_project_or_task_name
          @projects << {name => []}
          output.print_created_project(name)
        when "ls"
          output.print_list_of_projects
          if !@projects.nil? && !@projects.empty?
            @projects.each do |project|
              output.print_projects(project)
            end
            output.print_single_line
          else
            output.print_no_projects_created
          end
        when "d"
          if @projects && (@projects.size > 0)
            output.prompt_for_project_name
            project_name = input.get_project_or_task_name
            @deleted = @projects.delete_if { |project| project.keys.first == project_name.strip }.empty?
            if @deleted
              output.print_deleting_project(project_name)
            else
              output.print_project_does_not_exist(project_name)
            end
          end

          if !@deleted && (!@projects || @projects.empty?)
            output.print_cannot_delete_project
            output.print_no_projects_created
          end
          @deleted = nil
        when "e"
          if !@projects || @projects.size == 0
            output.print_cannot_edit_projects
            output.print_no_projects_created
            command = input.get_project_input
            next
          end

          output.prompt_for_project_name
          name = input.get_project_or_task_name
          if (@current_project = @projects.detect { |p| p.keys.first == name })
          output.print_edit_project_menu(name)
            command = input.get_project_input
            next
          else
            output.print_cannot_edit_project
            output.print_project_does_not_exist(name)
          end
        end
      else
        case command
        when "a"
          output.prompt_for_new_task_name
          task_name = input.get_project_or_task_name
          @current_project.values.first << task_name
          output.print_created_task(task_name)
        when "b"
          @current_project = false
          output.print_double_line
        when "c"
          output.prompt_for_new_project_name
          old_name = @current_project.keys.first
          new_name = input.get_project_or_task_name
          @current_project[new_name] = @current_project.values.first
          @current_project.delete(old_name)
          output.print_changed_project_name(old_name, new_name)
        when "e"
          name = input.get_project_or_task_name
          if (index = @current_project.values.first.find_index(name))
            output.print_editing_task(name)
            output.prompt_for_new_task_name
            new_name = input.get_project_or_task_name
            @current_project[@current_project.keys.first][index] = new_name
            output.print_changed_task_name(name, new_name)
          else
            output.print_task_does_not_exist(name)
          end
        when "d"
          project_name = @current_project.keys.first
          if @current_project.values.first.empty?
            output.print_no_tasks_created(project_name)
          else
            output.prompt_for_existing_task_name
            task_name = input.get_project_or_task_name
            if @current_project[@current_project.keys.first].delete(task_name.strip)
              output.print_deleted_task(task_name)
            else
              output.print_task_does_not_exist(task_name)
            end
          end
        when "f"
          project_name = @current_project.keys.first
          if @current_project.values.first.empty?
            output.print_no_tasks_created(project_name)
          else
            output.prompt_for_existing_task_name
            task_name = input.get_project_or_task_name
            if @current_project[@current_project.keys.first].delete(task_name.strip)
              output.print_finished_task(task_name)
            else
              output.print_task_does_not_exist(task_name)
            end
          end
        when "ls"
          if @current_project.values.first.empty?
            output.print_no_tasks_created_in_current_project(@current_project)
          else
            output.print_list_of_tasks
            @current_project.values.first.each do |task|
              output.print_task(task)
            end
            output.print_double_line
          end
        end
      end

      command = input.get_project_input
    end
  end

end
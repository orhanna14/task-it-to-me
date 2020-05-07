require_relative "menu_printer"
require_relative "project_printer"
require_relative "task_printer"
require_relative "prompter"
require_relative "user_input"
require_relative "projects"

class App
  attr_reader :menu_printer, :project_printer, :task_printer, :user_input, :prompter

  def initialize(stdout, stdin)
    @menu_printer = MenuPrinter.new(stdout)
    @project_printer = ProjectPrinter.new(stdout)
    @task_printer = TaskPrinter.new(stdout)
    @user_input = UserInput.new(stdin)
    @prompter = Prompter.new(stdout)
  end

  def run
    menu_printer.project_menu

    command = user_input.get_project_input

    while command != "q"
      if current_project_does_not_exist?
        case command
        when "a"
          prompter.project_name
          name = user_input.get_project_or_task_name
          projects.add_project(name)
          project_printer.created(name)
        when "ls"
          project_printer.list_of_projects
          if !projects.projects_empty?
            projects.list
            project_printer.single_line
          else
            project_printer.none_created
          end
        when "d"
          if !projects.projects_empty?
            prompter.project_name
            project_name = user_input.get_project_or_task_name
            if projects.project_can_be_found_and_deleted?(project_name)
              project_printer.deleting_a_project(project_name)
            else
              project_printer.does_not_exist(project_name)
            end
          end
          if projects.projects_empty?
            project_printer.cannot_delete_a_project
            project_printer.none_created
          end
        when "e"
          if projects.projects_empty?
            project_printer.cannot_edit_projects
            project_printer.none_created
            command = user_input.get_project_input
            next
          end
          prompter.project_name
          name = user_input.get_project_or_task_name
          if @current_project = projects.current_project_exists?(name)
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
          add_task_to_current_project(task_name)
          task_printer.created(task_name)
        when "b"
          @current_project = {}
          task_printer.double_line
        when "c"
          prompter.new_project_name
          old_name = original_name_of_current_project
          new_name = user_input.get_project_or_task_name
          update_name_association_with_existing_tasks(new_name, old_name)
          project_printer.changed_name(old_name, new_name)
        when "e"
          name = user_input.get_project_or_task_name
          if (index = tasks_in_current_project.find_index(name))
            task_printer.editing_task(name)
            prompter.new_task_name
            new_name = user_input.get_project_or_task_name
            change_name_of_task_in_current_project(index, new_name)
            task_printer.changed_task_name(name, new_name)
          else
            task_printer.does_not_exist(name)
          end
        when "d"
          project_name = original_name_of_current_project
          if tasks_in_current_project_do_not_exist?
            task_printer.no_tasks_created(project_name)
          else
            prompter.existing_task_name
            task_name = user_input.get_project_or_task_name
            if task_can_be_removed_from_current_project?(task_name)
              task_printer.deleted(task_name)
            else
              task_printer.does_not_exist(task_name)
            end
          end
        when "f"
          project_name = original_name_of_current_project
          if tasks_in_current_project_do_not_exist?
            task_printer.no_tasks_created(project_name)
          else
            prompter.existing_task_name
            task_name = user_input.get_project_or_task_name
            if task_can_be_removed_from_current_project?(task_name)
              task_printer.finished(task_name)
            else
              task_printer.does_not_exist(task_name)
            end
          end
        when "ls"
          if tasks_in_current_project_do_not_exist?
            task_printer.no_tasks_created_in_current_project(current_project)
          else
            task_printer.list_of_tasks
            tasks_in_current_project.each do |task|
              task_printer.task(task)
            end
            task_printer.double_line
          end
        end
      end

      command = user_input.get_project_input
    end
  end

  private

  def projects
    @projects ||= Projects.new(project_printer)
  end

  def current_project
    @current_project ||= {}
  end

  def current_project_does_not_exist?
    current_project.empty?
  end

  def add_task_to_current_project(task_name)
    current_project.values.first << task_name
  end

  def original_name_of_current_project
    current_project.keys.first
  end

  def tasks_in_current_project
    current_project.values.first
  end

  def task_can_be_removed_from_current_project?(task_name)
    current_project[original_name_of_current_project].delete(task_name.strip)
  end

  def tasks_in_current_project_do_not_exist?
    tasks_in_current_project.empty?
  end

  def update_name_association_with_existing_tasks(new_name, old_name)
    current_project[new_name] = tasks_in_current_project
    current_project.delete(old_name)
  end

  def change_name_of_task_in_current_project(index, new_name)
    current_project[original_name_of_current_project][index] = new_name
  end
end
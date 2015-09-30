require 'forwardable'
require 'json'

require_relative 'state'
require_relative 'project'
require_relative 'null_project'
require_relative 'task'
require_relative 'collection'
require_relative 'persistence'

require_relative 'formatter'
require_relative 'print'

require_relative 'menu_factory'
require_relative 'menu'
require_relative 'route'
require_relative 'input'

require_relative 'controller/create_project'
require_relative 'controller/list_projects'
require_relative 'controller/delete_project'
require_relative 'controller/edit_project'
require_relative 'controller/create_task'
require_relative 'controller/back'
require_relative 'controller/rename_project'
require_relative 'controller/rename_task'
require_relative 'controller/delete_task'
require_relative 'controller/finish_task'
require_relative 'controller/list_tasks'

class App
  attr_reader :state, :print, :menu_factory, :input

  def initialize(output_stream, input_stream)
    @print =        Print.new(output_stream)
    @input =        Input.new(input_stream)
    @state =        State.new
    @menu_factory = MenuFactory.new(state)
  end

  def run
    state.load

    print.welcome_message
    print.projects_menu(menu)

    command = input.get

    while command != 'q'
      if route = menu.get(command)
        route.perform(state, input, print)
      end

      print_menu
      command = input.get
    end
  end

  def menu
    menu_factory.generate
  end

  def print_menu
    if current_project?
      print.tasks_menu(current_project.name, menu)
    else
      print.projects_menu(menu)
    end
  end

  extend Forwardable

  def_delegators :state,
    :current_project?,
    :current_project
end

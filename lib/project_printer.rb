require_relative "colors"

class ProjectPrinter
  attr_accessor :stdout, :colors

  def initialize(stdout)
    @stdout = stdout
    @colors = Colors.new
  end

  def projects(project)
    stdout.puts("  #{project.keys.first}")
  end

  def deleting_a_project(project_name)
    stdout.puts colors.green + "Deleting project: '#{project_name.strip}'" + colors.escape_color
  end

  def does_not_exist(project_name)
    stdout.puts colors.orange + "Project doesn't exist: '#{project_name.strip}'" + colors.escape_color
  end

  def created(name)
    stdout.puts colors.green + ("Created project: '#{name}'") + colors.escape_color
  end

  def changed_name(old_name, new_name)
    stdout.puts colors.green + ("Changed project name from '#{old_name}' to '#{new_name}'") + colors.escape_color
  end

  def list_of_projects
    stdout.puts colors.green + ("Listing projects:") + colors.escape_color
  end

  def none_created
    stdout.puts colors.orange + ("No projects created\n\n") + colors.escape_color
  end

  def cannot_delete_a_project
    stdout.puts colors.orange + ("Can't delete a project") + colors.escape_color
  end

  def cannot_edit_a_project
    stdout.puts colors.orange + ("Can't edit project") + colors.escape_color
  end

  def cannot_edit_projects
    stdout.puts colors.orange + ("Can't edit any projects") + colors.escape_color
  end

  def single_line
    stdout.puts("\n")
  end
end
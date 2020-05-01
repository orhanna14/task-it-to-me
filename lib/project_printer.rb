require_relative "font_color_and_style"

class ProjectPrinter
  attr_accessor :stdout, :colors

  def initialize(stdout)
    @stdout = stdout
    @colors = FontColorAndStyle.new
  end

  def projects(project)
    stdout.puts("  #{project.keys.first}")
  end

  def deleting_a_project(project_name)
    stdout.puts colors.success("Deleting project: '#{project_name.strip}'")
  end

  def does_not_exist(project_name)
    stdout.puts colors.alert("Project doesn't exist: '#{project_name.strip}'")
  end

  def created(name)
    stdout.puts colors.success("Created project: '#{name}'")
  end

  def changed_name(old_name, new_name)
    stdout.puts colors.success("Changed project name from '#{old_name}' to '#{new_name}'")
  end

  def list_of_projects
    stdout.puts colors.success("Listing projects:")
  end

  def none_created
    stdout.puts colors.alert("No projects created")
  end

  def cannot_delete_a_project
    stdout.puts colors.alert("Can't delete a project")
  end

  def cannot_edit_a_project
    stdout.puts colors.alert("Can't edit project")
  end

  def cannot_edit_projects
    stdout.puts colors.alert("Can't edit any projects")
  end

  def single_line
    stdout.puts("\n")
  end
end
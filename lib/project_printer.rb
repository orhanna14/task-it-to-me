require_relative "text_formatting"

class ProjectPrinter
  attr_accessor :stdout, :text_format

  def initialize(stdout)
    @stdout = stdout
    @text_format = TextFormatting.new
  end

  def projects(project)
    stdout.puts("  #{project.keys.first}")
  end

  def deleting_a_project(project_name)
    stdout.puts text_format.success("Deleting project: '#{project_name.strip}'")
  end

  def does_not_exist(project_name)
    stdout.puts text_format.alert("Project doesn't exist: '#{project_name.strip}'")
  end

  def created(name)
    stdout.puts text_format.success("Created project: '#{name}'")
  end

  def changed_name(old_name, new_name)
    stdout.puts text_format.success("Changed project name from '#{old_name}' to '#{new_name}'")
  end

  def list_of_projects
    stdout.puts text_format.success("Listing projects:")
  end

  def none_created
    stdout.puts text_format.alert("No projects created")
  end

  def cannot_delete_a_project
    stdout.puts text_format.alert("Can't delete a project")
  end

  def cannot_edit_a_project
    stdout.puts text_format.alert("Can't edit project")
  end

  def cannot_edit_projects
    stdout.puts text_format.alert("Can't edit any projects")
  end

  def single_line
    stdout.puts("\n")
  end
end
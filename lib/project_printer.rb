class ProjectPrinter
  attr_accessor :stdout

  def initialize(stdout)
    @stdout = stdout
  end

  def projects(project)
    stdout.puts("  #{project.keys.first}\n")
  end

  def deleting_a_project(project_name)
    stdout.puts "\e[38;5;40mDeleting project:\e[0m '#{project_name.strip}'\n\n"
  end

  def does_not_exist(project_name)
    stdout.puts "\e[40;38;5;214mProject doesn't exist:\e[0m '#{project_name.strip}'\n\n"
  end

  def created(name)
    stdout.puts("\e[38;5;40mCreated project:\e[0m '#{name}'\n\n")
  end

  def changed_name(old_name, new_name)
    stdout.puts("\e[38;5;40mChanged project name from\e[0m '#{old_name}' \e[38;5;40mto\e[0m '#{new_name}'\n\n")
  end

  def list_of_projects
    stdout.puts("\e[38;5;40mListing projects:\e[0m\n")
  end

  def none_created
    stdout.puts("\e[40;38;5;214mNo projects created\e[0m\n\n")
  end

  def cannot_delete_a_project
    stdout.puts("\e[40;38;5;214mCan't delete a project\e[0m")
  end

  def cannot_edit_a_project
    stdout.puts("\e[40;38;5;214mCan't edit project\e[0m")
  end

  def cannot_edit_projects
    stdout.puts("\e[40;38;5;214mCan't edit any projects\e[0m")
  end

  def single_line
    stdout.puts("\n")
  end
end
require "spec_helper"
require "project_printer"

RSpec.describe ProjectPrinter do
  it "#changed_name prints out that a specific project's name has been changed" do
    stdout = StringIO.new("")
    project_name = "First project"
    new_project_name = "Updated project"
    project_printer = ProjectPrinter.new(stdout)

    project_printer.changed_name(project_name, new_project_name)

    expect(normalized_output(stdout)).to include("Changed project name from 'First project' to 'Updated project'")
  end

  it "#created prints out that a specific project has been created" do
    stdout = StringIO.new("")
    project_name = "First project"
    project_printer = ProjectPrinter.new(stdout)

    project_printer.created(project_name)

    expect(normalized_output(stdout)).to include("Created project: 'First project'")
  end

  it "#does_not_exist prints out that a specific project does not exist" do
    stdout = StringIO.new("")
    project_name = "First project "
    project_printer = ProjectPrinter.new(stdout)

    project_printer.does_not_exist(project_name)

    expect(normalized_output(stdout)).to include("Project doesn't exist: 'First project'")
  end

  it "#deleting_a_project prints out that a specific project is being deleted" do
    stdout = StringIO.new("")
    project_name = "First project "
    project_printer = ProjectPrinter.new(stdout)

    project_printer.deleting_a_project(project_name)

    expect(normalized_output(stdout)).to include("Deleting project: 'First project'")
  end

  it "#projects prints out the first project's name" do
    stdout = StringIO.new("")
    projects = {"First project" => []}
    project_printer = ProjectPrinter.new(stdout)

    project_printer.projects(projects)

    expect(normalized_output(stdout)).to include("First project")
  end
end
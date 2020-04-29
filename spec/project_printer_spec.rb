require "spec_helper"
require "project_printer"

RSpec.describe ProjectPrinter do
  describe "#changed_name" do
    it "changes the project name" do
      stdout = StringIO.new("")
      project_name = "First project"
      new_project_name = "Updated project"
      project_printer = ProjectPrinter.new(stdout)

      project_printer.changed_name(project_name, new_project_name)

      expect(normalized_output(stdout)).to include("Changed project name from 'First project' to 'Updated project'")
    end
  end

  describe "#created" do
    it "creates the project name" do
      stdout = StringIO.new("")
      project_name = "First project"
      project_printer = ProjectPrinter.new(stdout)

      project_printer.created(project_name)

      expect(normalized_output(stdout)).to include("Created project: 'First project'")
    end
  end

  describe "#does_not_exist" do
    it "States that a project does not exist" do
      stdout = StringIO.new("")
      project_name = "First project "
      project_printer = ProjectPrinter.new(stdout)

      project_printer.does_not_exist(project_name)

      expect(normalized_output(stdout)).to include("Project doesn't exist: 'First project'")
    end
  end

  describe "#deleting_a_project" do
    it "States that it is deleting a project" do
      stdout = StringIO.new("")
      project_name = "First project "
      project_printer = ProjectPrinter.new(stdout)

      project_printer.deleting_a_project(project_name)

      expect(normalized_output(stdout)).to include("Deleting project: 'First project'")
    end
  end

  describe "#projects" do
    it "lists the first project" do
      stdout = StringIO.new("")
      projects = {"First project" => []}
      project_printer = ProjectPrinter.new(stdout)

      project_printer.projects(projects)

      expect(normalized_output(stdout)).to include("First project")
    end
  end
end
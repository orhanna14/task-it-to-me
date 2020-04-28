require "spec_helper"
require "project_printer"

RSpec.describe ProjectPrinter do
  describe "#changed_name" do
    it "changes the project name" do
      stdout = StringIO.new("")
      project_name = "First project"
      new_project_name = "Updated project"
      project_printer = ProjectPrinter.new(stdout)
      output = "\e[38;5;40mChanged project name from\e[0m 'First project' \e[38;5;40mto\e[0m 'Updated project'"

      project_printer.changed_name(project_name, new_project_name)

      expect(stdout.string).to include(output)
      
    end
  end

  describe "#created" do
    it "creates the project name" do
      stdout = StringIO.new("")
      project_name = "First project"
      project_printer = ProjectPrinter.new(stdout)
      output = "\e[38;5;40mCreated project:\e[0m 'First project'"

      project_printer.created(project_name)

      expect(stdout.string).to include(output)
      
    end
  end

  describe "#does_not_exist" do
    it "States that a project does not exist" do
      stdout = StringIO.new("")
      project_name = "First project "
      project_printer = ProjectPrinter.new(stdout)
      output = "\e[40;38;5;214mProject doesn't exist:\e[0m 'First project'"

      project_printer.does_not_exist(project_name)

      expect(stdout.string).to include(output)
      
    end
  end

  describe "#deleting_a_project" do
    it "States that it is deleting a project" do
      stdout = StringIO.new("")
      project_name = "First project "
      project_printer = ProjectPrinter.new(stdout)
      output = "\e[38;5;40mDeleting project:\e[0m 'First project'"

      project_printer.deleting_a_project(project_name)

      expect(stdout.string).to include(output)
      
    end
  end

  describe "#projects" do
    it "lists the first project" do
      stdout = StringIO.new("")
      projects = {"First project" => []}
      project_printer = ProjectPrinter.new(stdout)
      output = "  First project"

      project_printer.projects(projects)

      expect(stdout.string).to include(output)
      
    end
  end
end
require "spec_helper"
require "task_printer"

RSpec.describe TaskPrinter do
  describe "#finished" do
    it "states that the task is finished" do
      stdout = StringIO.new("")
      task_name = "First task"
      task_printer = TaskPrinter.new(stdout)

      task_printer.finished(task_name)

      expect(normalized_output(stdout)).to include("Finished task: 'First task'")
    end
  end

  describe "#deleted" do
    it "states that the task is deleted" do
      stdout = StringIO.new("")
      task_name = "First task"
      task_printer = TaskPrinter.new(stdout)

      task_printer.deleted(task_name)

      expect(normalized_output(stdout)).to include("Deleted task: 'First task'")
    end
  end

  describe "#no_tasks_created_in_current_project" do
    it "states that no tasks are created" do
      stdout = StringIO.new("")
      current_project = {"First project"=> []}
      task_printer = TaskPrinter.new(stdout)

      task_printer.no_tasks_created_in_current_project(current_project)

      expect(normalized_output(stdout)).to include("No tasks created in 'First project'")
    end
  end

  describe "#no_tasks_created" do
    it "states that no tasks are created" do
      stdout = StringIO.new("")
      project = "First project"
      task_printer = TaskPrinter.new(stdout)

      task_printer.no_tasks_created(project)

      expect(normalized_output(stdout)).to include("No tasks created in 'First project'")
    end
  end

  describe "#changed_task_name" do
    it "states that it has changed the task name" do
      stdout = StringIO.new("")
      task_name = "First task"
      task_name_new = "Updated task"
      task_printer = TaskPrinter.new(stdout)

      task_printer.changed_task_name(task_name, task_name_new)

      expect(normalized_output(stdout)).to include("Changed task name from 'First task' to 'Updated task'")
    end
  end

  describe "#editing_task" do
    it "states that it is editing a task" do
      stdout = StringIO.new("")
      task_name = "First task"
      task_printer = TaskPrinter.new(stdout)

      task_printer.editing_task(task_name)

      expect(normalized_output(stdout)).to include("Editing task: 'First task'")
    end
  end

  describe "#created" do
    it "states that it has created a task" do
      stdout = StringIO.new("")
      task_name = "First task"
      task_printer = TaskPrinter.new(stdout)

      task_printer.created(task_name)

      expect(normalized_output(stdout)).to include("Created task: 'First task'")
    end
  end

  describe "#does_not_exist" do
    it "states that the task does not exist" do
      stdout = StringIO.new("")
      task_name = "First task"
      task_printer = TaskPrinter.new(stdout)

      task_printer.does_not_exist(task_name)

      expect(normalized_output(stdout)).to include("Task doesn't exist: 'First task'")
    end
  end

  describe "#task" do
    it "outputs the task" do
      stdout = StringIO.new("")
      task_name = "First task"
      task_printer = TaskPrinter.new(stdout)

      task_printer.task(task_name)

      expect(normalized_output(stdout)).to include("First task")
    end
  end
end
require "spec_helper"
require "task_printer"

RSpec.describe TaskPrinter do
  describe "#finished" do
    it "states that the task is finished" do
      stdout = StringIO.new("")
      task_name = "First task"
      task_printer = TaskPrinter.new(stdout)
      output = "\e[38;5;40mFinished task:\e[0m 'First task'"

      task_printer.finished(task_name)

      expect(stdout.string).to include(output)
    end
  end

  describe "#deleted" do
    it "states that the task is deleted" do
      stdout = StringIO.new("")
      task_name = "First task"
      task_printer = TaskPrinter.new(stdout)
      output = "\e[38;5;40mDeleted task:\e[0m 'First task'"

      task_printer.deleted(task_name)

      expect(stdout.string).to include(output)
    end
  end

  describe "#no_tasks_created_in_current_project" do
    it "states that no tasks are created" do
      stdout = StringIO.new("")
      current_project = {"First project"=> []}
      task_printer = TaskPrinter.new(stdout)
      output = "\e[40;38;5;214mNo tasks created in \e[0m'First project'"

      task_printer.no_tasks_created_in_current_project(current_project)

      expect(stdout.string).to include(output)
    end
  end

  describe "#no_tasks_created" do
    it "states that no tasks are created" do
      stdout = StringIO.new("")
      project = "First project"
      task_printer = TaskPrinter.new(stdout)
      output = "\e[40;38;5;214mNo tasks created in 'First project'\e[0m"

      task_printer.no_tasks_created(project)

      expect(stdout.string).to include(output)
    end
  end

  describe "#changed_task_name" do
    it "states that it has changed the task name" do
      stdout = StringIO.new("")
      task_name = "First task"
      task_name_new = "Updated task"
      task_printer = TaskPrinter.new(stdout)
      output = "\e[38;5;40mChanged task name from\e[0m 'First task' \e[38;5;40mto\e[0m 'Updated task'"

      task_printer.changed_task_name(task_name, task_name_new)

      expect(stdout.string).to include(output)
    end
  end

  describe "#editing_task" do
    it "states that it is editing a task" do
      stdout = StringIO.new("")
      task_name = "First task"
      task_printer = TaskPrinter.new(stdout)
      output = "\e[38;5;40mEditing task:\e[0m 'First task'"

      task_printer.editing_task(task_name)

      expect(stdout.string).to include(output)
    end
  end

  describe "#created" do
    it "states that it has created a task" do
      stdout = StringIO.new("")
      task_name = "First task"
      task_printer = TaskPrinter.new(stdout)
      output = "\e[38;5;40mCreated task:\e[0m 'First task'"

      task_printer.created(task_name)

      expect(stdout.string).to include(output)
    end
  end

  describe "#does_not_exist" do
    it "states that the task does not exist" do
      stdout = StringIO.new("")
      task_name = "First task"
      task_printer = TaskPrinter.new(stdout)
      output = "\e[40;38;5;214mTask doesn't exist:\e[0m 'First task'"

      task_printer.does_not_exist(task_name)

      expect(stdout.string).to include(output)
    end
  end

  describe "#task" do
    it "outputs the task" do
      stdout = StringIO.new("")
      task_name = "First task"
      task_printer = TaskPrinter.new(stdout)
      output = "  First task"

      task_printer.task(task_name)

      expect(stdout.string).to include(output)
    end
  end
end
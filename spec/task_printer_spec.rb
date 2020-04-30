require "spec_helper"
require "task_printer"

RSpec.describe TaskPrinter do
  it "#finished prints out that a specific task is finished" do
    stdout = StringIO.new("")
    task_name = "First task"
    task_printer = TaskPrinter.new(stdout)

    task_printer.finished(task_name)

    expect(normalized_output(stdout)).to include("Finished task: 'First task'")
  end

  it "#deleted prints out that a specific task was deleted" do
    stdout = StringIO.new("")
    task_name = "First task"
    task_printer = TaskPrinter.new(stdout)

    task_printer.deleted(task_name)

    expect(normalized_output(stdout)).to include("Deleted task: 'First task'")
  end

  it "#no_tasks_created_in_current_project prints out that no tasks are created in the current project" do
    stdout = StringIO.new("")
    current_project = {"First project"=> []}
    task_printer = TaskPrinter.new(stdout)

    task_printer.no_tasks_created_in_current_project(current_project)

    expect(normalized_output(stdout)).to include("No tasks created in 'First project'")
  end

  it "#no_tasks_created prints out that no tasks are created in a specific project" do
    stdout = StringIO.new("")
    project = "First project"
    task_printer = TaskPrinter.new(stdout)

    task_printer.no_tasks_created(project)

    expect(normalized_output(stdout)).to include("No tasks created in 'First project'")
  end

  it "#changed_task_name prints out that the task's name has been changed" do
    stdout = StringIO.new("")
    task_name = "First task"
    task_name_new = "Updated task"
    task_printer = TaskPrinter.new(stdout)

    task_printer.changed_task_name(task_name, task_name_new)

    expect(normalized_output(stdout)).to include("Changed task name from 'First task' to 'Updated task'")
  end

  it "#editing_task prints out that a specific task is being edited" do
    stdout = StringIO.new("")
    task_name = "First task"
    task_printer = TaskPrinter.new(stdout)

    task_printer.editing_task(task_name)

    expect(normalized_output(stdout)).to include("Editing task: 'First task'")
  end

  it "#created prints out that a specific task has been created" do
    stdout = StringIO.new("")
    task_name = "First task"
    task_printer = TaskPrinter.new(stdout)

    task_printer.created(task_name)

    expect(normalized_output(stdout)).to include("Created task: 'First task'")
  end

  it "#does_not_exist prints out that a specific task does not exist" do
    stdout = StringIO.new("")
    task_name = "First task"
    task_printer = TaskPrinter.new(stdout)

    task_printer.does_not_exist(task_name)

    expect(normalized_output(stdout)).to include("Task doesn't exist: 'First task'")
  end

  it "#task prints out a task's name" do
    stdout = StringIO.new("")
    task_name = "First task"
    task_printer = TaskPrinter.new(stdout)

    task_printer.task(task_name)

    expect(normalized_output(stdout)).to include("First task")
  end
end
require_relative "project_printer"

class Projects
  attr_reader :projects, :project_printer 
  
  def initialize(project_printer)
    @projects = []
    @project_printer = project_printer
  end

  def projects_empty?
    projects.empty?
  end

  def add_project(name)
    projects << {name => []}
  end

  def current_project_exists?(name)
    projects.detect { |p| p.keys.first == name }
  end

  def list
    projects.each do |project|
      project_printer.projects(project)
    end
  end

  def project_can_be_found_and_deleted?(project_name)
    projects.delete_if { |project| project.keys.first == project_name.strip }.empty?
  end

end
require "spec_helper"
require "menu_printer"

RSpec.describe MenuPrinter do
  describe "#edit_project_menu" do
    it "given an existing project, prints out the project's name in the options" do
      stdout = StringIO.new("")
      project_name = "Build tiny home"
      menu = MenuPrinter.new(stdout)

      menu.edit_project_menu(project_name)

      expect(normalized_output(stdout)).to include("Editing project: 'Build tiny home'")
    end
  end
end
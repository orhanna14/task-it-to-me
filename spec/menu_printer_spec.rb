require "spec_helper"
require "menu_printer"

RSpec.describe MenuPrinter do
  describe "#edit_project_menu" do
    it "given an existing project, prints out the project's name in the options" do
      stdout = StringIO.new("")
      project_name = "Build tiny home"
      menu = MenuPrinter.new(stdout)
      output = <<~MENU
      Editing project: 'Build tiny home'
      MENU

      menu.edit_project_menu(project_name)

      expect(stdout.string).to include(output)
    end
  end
end
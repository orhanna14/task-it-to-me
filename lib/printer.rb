class Printer
  attr_accessor :stdout

  def initialize(stdout)
    @stdout = stdout
  end

###Projects & Tasks
  #Lines
  def single_line
    stdout.puts("\n")
  end

  def double_line
    stdout.puts("\n\n")
  end
end
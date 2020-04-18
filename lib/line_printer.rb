class LinePrinter
  attr_accessor :stdout

  def initialize(stdout)
    @stdout = stdout
  end

  def single
    stdout.puts("\n")
  end

  def double
    stdout.puts("\n\n")
  end
end
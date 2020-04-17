class InputStream
  attr_reader :stdin

  def initialize(stdin)
    @stdin = stdin
  end

#Projects & Tasks

  def get_project_or_task_name
    stdin.gets.chomp
  end

#Projects Only

  def get_project_input
    stdin.gets.gsub(/\s+/, '').chomp
  end
end
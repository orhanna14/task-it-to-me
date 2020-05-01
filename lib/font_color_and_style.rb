class FontColorAndStyle
  GREEN = "\e[38;5;40m"
  ORANGE = "\e[40;38;5;214m"
  WHITE = "\e[0;37m"
  MAGENTA = "\e[0;35m"
  ITALICS = "\e[0;3m"
  END_FORMATTING = "\e[0m"

  def emphasis(text)
    "#{ITALICS}#{text}#{END_FORMATTING}"
  end

  def alert(text)
    "#{ORANGE}#{text}#{END_FORMATTING}"
  end

  def success(text)
    "#{GREEN}#{text}#{END_FORMATTING}"
  end

  def default(text)
    "#{WHITE}#{text}#{END_FORMATTING}"
  end

  def options(text)
    "#{MAGENTA}#{text}#{END_FORMATTING}"
  end
end
class FontColorAndStyle

  def italics(text)
    "\e[0;3m#{text}\e[0m"
  end

  def orange(text)
    "\e[40;38;5;214m#{text}\e[0m"
  end

  def green(text)
    "\e[38;5;40m#{text}\e[0m"
  end

  def white(text)
    "\e[0;37m#{text}\e[0m"
  end

  def magenta(text)
    "\e[0;35m#{text}\e[0m"
  end
end
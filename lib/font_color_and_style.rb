class FontColorAndStyle

  def italics
    "\e[0;3m"
  end

  def orange
    "\e[40;38;5;214m"
  end

  def green
    "\e[38;5;40m"
  end

  def escape
    "\e[0m"
  end
end
class String
  def red
    self.colorize(:red)
  end
  def yellow
    self.colorize(:yellow)
  end
  def green
    self.colorize(:green)
  end
  def titleize
    self.gsub(/\b(?<!['`])[a-z]/) { $&.capitalize }
  end
  def underscore
    self.gsub(/::/, '/')
        .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
        .gsub(/([a-z\d])([A-Z])/,'\1_\2')
        .tr("-", "_").downcase
  end
end
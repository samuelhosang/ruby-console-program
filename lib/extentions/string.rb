class String
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
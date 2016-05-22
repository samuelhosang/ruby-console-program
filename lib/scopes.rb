class Scopes
  attr_accessor :current

  def initialize
    self.current = [:program]
  end
  # Adds a scope to the collection.
  #*********************************************************************************************************************
  def add(scope)
    self.current = current + [scope]
  end
  # Removes a scope from the collection.
  #*********************************************************************************************************************
  def remove(scope)
    self.current = current - [scope]
    scope_check
  end
  # Removes the last added scope.
  #*********************************************************************************************************************
  def remove_last
    self.current = current[0..-2]
    scope_check
  end
  # Returns a string of the active scope (the last added scope).
  #*********************************************************************************************************************
  def active
    "[#{current.last.upcase}]"
  end
  # Returns a boolean for if the scope collection is empty.
  #*********************************************************************************************************************
  def empty?
    current.empty?
  end

  private
    # Stops the program if there are no scopes present.
    #*******************************************************************************************************************
    def scope_check
      Program.running = false if empty?
    end

end
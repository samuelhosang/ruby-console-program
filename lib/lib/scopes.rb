class Scopes
  attr_accessor :active

  def initialize
    add(ConsoleProgram.base_module.downcase.to_sym)
  end
  # Adds a scope to the collection.
  #*********************************************************************************************************************
  def add(scope)
    self.active = (active||[]) + [scope]
  end
  # Removes a scope from the collection.
  #*********************************************************************************************************************
  def remove(scope)
    self.active = active - [scope]
    scope_check
  end
  # Removes the last added scope.
  #*********************************************************************************************************************
  def remove_last
    remove(active[-1])
  end
  # Returns the newest scope scope.
  #*********************************************************************************************************************
  def current
    active.last
  end
  # Returns a string of the active scope (the last added scope).
  #*********************************************************************************************************************
  def to_s
    "[#{active.last.upcase}]"
  end
  # Returns a boolean for if the scope collection is empty.
  #*********************************************************************************************************************
  def empty?
    active.empty?
  end

  private
    # Stops the program if there are no scopes present.
    #*******************************************************************************************************************
    def scope_check
      ConsoleProgram.running = false if empty?
    end

end
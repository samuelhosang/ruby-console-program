class ProgramExceptions::InvalidName < ProgramExceptions::AdminException
  def initialize(name)
    super("Invalid Name: '#{name}'.")
  end
end
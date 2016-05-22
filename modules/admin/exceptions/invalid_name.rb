class ProgramExceptions::InvalidName < ProgramExceptions::AdminException
  def initialize(name)
    @message = "Invalid Name: '#{name}'."
  end
end
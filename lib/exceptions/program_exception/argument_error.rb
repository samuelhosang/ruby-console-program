class ProgramExceptions::ArgumentError < ProgramExceptions::ProgramException
  def initialize(command)
    super("You did not specify what you want to '#{command}'.")
  end
end
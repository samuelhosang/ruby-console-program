class ProgramExceptions::ArgumentTypeError < ProgramExceptions::ProgramException
  def initialize(object, klass)
    super("'#{object.class}' is not a '#{klass}'.")
  end
end
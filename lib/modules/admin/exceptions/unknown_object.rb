class ProgramExceptions::UnknownObject < ProgramExceptions::AdminException
  def initialize(object)
    super("Unknown Object: '#{object}'.")
  end
end
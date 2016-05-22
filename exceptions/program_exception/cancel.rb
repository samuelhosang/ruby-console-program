class ProgramExceptions::Cancel < ProgramExceptions::ProgramException
  def initialize
    @message = 'Cancelled by user.'
  end
end
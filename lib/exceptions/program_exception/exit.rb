class ProgramExceptions::Exit < ProgramExceptions::ProgramException
  def initialize
    @message = 'User exit.'
  end
end
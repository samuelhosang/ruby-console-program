class ProgramExceptions::CommandNotFound < ProgramExceptions::ProgramException
  def initialize(command, scopes)
    @message = "Command '#{command}' not found in scopes: '#{scopes.join(', ')}'.".red
  end
end
class ConsoleProgram::Reload < Command
  @alternate_commands = %w`/r`
  @prefix = '/'
  @hidden = true
  @help = 'Reloads required game files.'
  @extended_help = [@help, '/reload']
  def run
    ConsoleProgram.reload
  end

end

class ConsoleProgram::Reload < Command
  @alternate_commands = %w`/r`
  @prefix = '/'
  @hidden = true
  @extended_help = [(@help = 'Reloads required game files.'),'/reload']
  def run
    ConsoleProgram.reload
  end

end

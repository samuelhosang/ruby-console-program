class ConsoleProgram::Clear < Command
  @prefix = '/'
  @extended_help = [(@help = 'Clears the game terminal.'),'/clear']
  @alternate_commands = %w`clear clr`
  def run
    system('clear') #IF windows
    system('cls')   #IF Linux
  end
end
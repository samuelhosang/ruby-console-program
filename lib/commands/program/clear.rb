class ConsoleProgram::Clear < Command
  @prefix = '/'
  @help = 'Clears the game terminal.'
  @extended_help = [@help,'/clear']
  @alternate_commands = %w`clear clr`
  def run
    #= TODO (Required) Build a way to determine what the current OS is and handle it appropriately. -shosang
    system('clear') #IF windows
    system('cls')   #IF Linux
  end
end
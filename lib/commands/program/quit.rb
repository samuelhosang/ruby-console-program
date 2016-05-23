class ConsoleProgram::Quit < Command
  @prefix = '/'
  @help = 'Quits the program.'
  @extended_help = ['Quits the program and returns you to the terminal.', '/quit']
  @alternate_commands = %w`/q`
  def run
    ConsoleProgram.running = false if confirm('Are you sure you want to exit the program?')
  end
end
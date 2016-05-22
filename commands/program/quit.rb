class Program::Quit < Command
  @prefix = '/'
  @extended_help = [@help = 'Quits the program', '/quit']
  def run
    Program.running = false if confirm('Are you sure you want to exit the program?')
  end
end
class ConsoleProgram::Exit < Command
  @prefix = '/'
  @alternate_commands = %w`/x`
  @help = 'Exits the current module.'
  @extended_help = [ @help, '/exit']
  def run
    if confirm "Are you sure you want to quit #{ConsoleProgram.scopes.current}?"
      ConsoleProgram.exit_scope
    end
  end
end
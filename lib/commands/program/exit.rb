class ConsoleProgram::Exit < Command
  @prefix = '/'
  @alternate_commands = %w`/x`
  @extended_help = [(@help = 'Exits the current module.'),'/exit']
  def run
    if confirm "Are you sure you want to quit #{ConsoleProgram.scopes.current}?"
      ConsoleProgram.exit_scope
    end
  end
end
class Program::Exit < Command
  @prefix = '/'
  @extended_help = [(@help = 'Exits the current module.'),'/exit']
  def run
    if confirm "Are you sure you want to quit #{Program.scopes.last.to_s.titleize}?"
      Program.exit_scope
    end
  end
end
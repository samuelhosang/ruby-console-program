class ConsoleProgram::Admin < Command
  @prefix = '/'
  @alternate_commands = %w`@`
  @hidden = true
  def run
    if !ConsoleProgram.scopes.active.include?(:admin)
      ConsoleProgram.scopes.add(:admin)
    else
      tell_user 'You are already in Admin Mode, dumbass. Now exiting Admin Mode.'
      ConsoleProgram.scopes.remove_last
    end
  end

end
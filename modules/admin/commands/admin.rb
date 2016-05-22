class Program::Admin < Command
  @prefix = '/'
  @alternate_commands = %w`@`
  @hidden = true
  def run
    if !Program.scopes.active.include?(:admin)
      Program.scopes.add(:admin)
    else
      tell_user 'You are already in Admin Mode, dumbass. Now exiting Admin Mode.'
      Program.scopes.remove_last
    end
  end

end
class Program::Admin < Command
  @prefix = '/'
  def run
    Program.scopes.add(:admin)
  end

end
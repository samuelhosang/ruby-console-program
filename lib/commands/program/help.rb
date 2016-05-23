class ConsoleProgram::Help < Command
  @alternate_commands = %w`help`
  @help = 'Displays system commands.'
  @extended_help = [
      'General purpose help command.',
      "/help #{'COMMAND'.light_blue}",
      '-> COMMAND = Name of command to get information for.',
      nil,
      'EX: "/help help" => Displays this information.'
  ]

  @prefix = '/'
  def run
    if args.empty?
      # tell_user 'Displaying results for "/help".'
      display_array ConsoleProgram.processor.help
    else
      if (commands = Processor.search(args.join(' '), ConsoleProgram.scopes.active)).length == 1
        display_array commands.first.extended_help
      else
        tell_user 'Too many commands matched input, please try again.'.red
      end
    end
  end
end
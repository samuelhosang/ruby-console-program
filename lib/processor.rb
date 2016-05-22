class Processor
  include Console
  attr_accessor  :commands

  def initialize
    set_available_commands
  end
  # Main method.
  # Takes user input and finds an appropriate command to run.
  #*********************************************************************************************************************
  def process_input(input)
    args = input.split(' ')
    command = args.shift
    results = self.class.search(command, Program.scopes.active)
    if results.length == 1
      results.first.new(args)
    else
      multiple_commands = []
      results.each do |klass|
        multiple_commands << klass unless klass.has_alternate_commands? && klass.alternate_commands.include?(command)
      end
      result = (multiple_commands.length == 1 ? multiple_commands.first : nil)
      puts 'Multiple commands found, which do you mean?' if result.nil?
      while result.nil?
        output_string = []
        results.each_with_index{|r, i| output_string << "#{i + 1}: #{r.to_s.split('::')[1..-1].join('->')}" }
        get output_string.join(results.length > 5 ? "\n" : ', ')
        result = results[input.to_i - 1]
        puts 'Unrecognized input' if result.nil?
      end
      result.new(*args)
    end

  end

  # Displays basic command help.
  #*********************************************************************************************************************
  def help
    messages = ['- Help -']

    max_command_length = Program.scopes.active.map{|key| @@commands[key].keys }.flatten.map(&:length).max

    max_alias_length = Program.scopes.active
                           .map{|key| @@commands[key].values }
                           .flatten.uniq
                           .map(&:alternate_commands)
                           .compact.map{|alt| alt.join(', ') }
                           .map(&:length).max

    Program.scopes.active.each_with_index do |key, index|
      messages << "- #{key.to_s.titleize} Commands -"
      @@commands[key].each do |name, klass|
        unless klass.hidden || (!klass.alternate_commands.nil? && klass.alternate_commands.include?(name))
          # /help - help - Help description.
          space = {}
          command = name
          space[:command] = ' ' * (max_command_length - name.length)
          aliases = klass.alternate_commands.nil? ? '' : klass.alternate_commands.join(', ')
          space[:alias] = ' ' * (max_alias_length - (klass.alternate_commands||[]).join(', ').length)
          help = klass.help
          messages << "#{command}#{space[:command]} - #{aliases}#{space[:alias]} - #{help}"
        end
      end
      messages << nil unless (index + 1) == Program.scopes.active.length
    end
    messages << nil
  end

  private
    # Sets available commands to be used.
    #TODO Maybe find a better way to store the hash?
    #*******************************************************************************************************************
    def set_available_commands
      hash = {}
      Command.descendants.each do |child|
        mod, command = child.to_s.split('::')
        next if command.nil?
        hash[mod.downcase.to_sym] ||= {}
        hash[mod.downcase.to_sym][child.command_reference] = child
        child.alternate_commands.each{|cmd| hash[mod.downcase.to_sym][cmd] = child } unless child.alternate_commands.nil?
      end
      @@commands = hash
    end
    # Searches all loaded command files and returns an array of results.
    #*******************************************************************************************************************
    def self.search(command, scopes)
      results = []
      scopes.each { |key| results << @@commands[key][command] if @@commands[key].has_key?(command) }
      return results if results.length > 0
      raise ProgramExceptions::CommandNotFound.new(command, scopes)
    end

end
class Command
  include Console
  #=Default Options#
  @prefix = ''
  @alternate_commands = nil
  @extended_help = nil
  @hidden = false
  @help = 'No help defined.'
  # Sets args variable and runs the commend.
  #   The definition for run will leave in that commands file.
  #*********************************************************************************************************************
  def initialize(args=[])
    @args = args
    self.run
  end
  # Raises an error if args are not present.
  #*********************************************************************************************************************
  def args_required
    raise ProgramExceptions::ArgumentError.new(self.to_s.split('::').last.split(':').first.downcase) unless args_check
  end
  # Return true if args are present.
  #*********************************************************************************************************************
  def args_check
    !(@args.nil? || @args == [])
  end
  #
  #*********************************************************************************************************************
  def self.hidden
    @hidden
  end
  #
  #*********************************************************************************************************************
  def self.help
    @help
  end
  #
  #*********************************************************************************************************************
  def self.command_reference
    (@prefix || '') + self.to_s.split('::').last.underscore
  end
  #
  #*********************************************************************************************************************
  def self.alternate_commands
    @alternate_commands
  end
  #
  #*********************************************************************************************************************
  def self.has_alternate_commands?
    !@alternate_commands.nil?
  end
  #
  #*********************************************************************************************************************
  def self.descendants
    #= Return all children of this class.
    ObjectSpace.each_object(Class).select{|klass| klass < self }.sort{|x,y| x.name <=> y.name}
  end
  #
  #*********************************************************************************************************************
  def self.extended_help
    messages = ["- Command Help: #{self.command_reference} -"]
    messages << @extended_help||'No extended help defined.'
    unless @alternate_commands.nil?
      messages << nil
      messages << 'Aliases: ' + @alternate_commands.join(', ')
    end
    messages << nil
    return messages.flatten
  end

end
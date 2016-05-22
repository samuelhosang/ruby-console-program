module Admin

  class Generator
    include Console

    def initialize(type, name, options)
      raise ProgramExceptions::InvalidName.new(name||'') if name.nil? || name == ''
      case type
        when 'command', 'cmd'
        when 'exception', 'exc'
        when 'module', 'mod'
        else raise ProgramExceptions::UnknownObject.new(type)
      end
      tell_user "Generate: #{type} named '#{name}' with #{options}"
    end

  end

end
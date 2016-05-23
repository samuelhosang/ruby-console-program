module Admin

  class Generator
    include Console

    def initialize(type, name, args)
      raise ProgramExceptions::InvalidName.new(name||'') if name.nil? || name == ''
      case type
        when 'command', 'cmd'   then klass = Generator::Command
        when 'exception', 'exc' then klass = Generator::Exception
        when 'module', 'mod'    then klass = Generator::Module
        else raise ProgramExceptions::UnknownObject.new(type)
      end
      tell_user "Generate: #{klass.to_s.split('::').last} named '#{name}' with #{args}"
      parse_arguments args + ['name', name]
    end

    def parse_arguments(args)
      @args = format_arguments args.map{|arg| arg.split('=') }.to_h
    end

    def format_arguments(args)
      tell_user args.inspect
      hash = {}
      hash[:module] = args['-m']||'Program'
      hash[:name] = args['name']
      return hash
    end

  end

  class Generator::Command < Generator
    include Console

    def initialize(args)
      

    end
  end

  class Generator::Exception < Generator
    include Console

    def initialize(args)

    end
  end

  class Generator::Module < Generator
    include Console

    def initialize(args)

    end
  end

end
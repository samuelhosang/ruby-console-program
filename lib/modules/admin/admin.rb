module Admin

  class Generator
    include Console

    def initialize(type, name, options)
      tell_user "Generate: #{type} named '#{name}' with #{options}"
    end
  end

end
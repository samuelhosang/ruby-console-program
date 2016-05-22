module Program
  require_relative 'console'
  extend Console

  # Launching Method.
  #*********************************************************************************************************************
  def self.initialize
    load_files
    start
    run
    close
  end
  # Setter for the 'running' flag.
  #*********************************************************************************************************************
  def self.running=(value)
    @running = value
  end
  # Returns a boolean for if the Program is running.
  #*********************************************************************************************************************
  def self.running?
    @running
  end
  # Current scopes for the Program.
  #*********************************************************************************************************************
  def self.scopes
    @scopes
  end
  # Command Processor instance.
  #*********************************************************************************************************************
  def self.processor
    @processor
  end
  # Reloads the required files.
  #*********************************************************************************************************************
  def self.reload
    load_files(true)
    @processor = Processor.new
  end
  # Exits the most recent scope entered.
  #*********************************************************************************************************************
  def self.exit_scope
    @scopes.remove_last
  end
  private
    # Loads required files.
    #*******************************************************************************************************************
    def self.load_files(reload=false)
      i = 0
      until (set = Dir['*' + ('/*' * i) + '/*.rb']).empty?
        set.map{|s| s.include?('spec') ? nil : s }.compact.each{|file| load(file) }
        i += 1
      end
      tell_user "\n\nAll files #{reload ? 're' : ''}loaded.".green
    end
    # Starts the Program.
    #*******************************************************************************************************************
    def self.start
      @running = true
      @scopes = Scopes.new
      @processor = Processor.new
    end
    # Runs the Program
    #*******************************************************************************************************************
    def self.run
      while @running
        tell_user("\n#{@scopes} What would you like to do?")
        begin
          @processor.process_input user_input
        rescue ProgramExceptions::Exit
          close
        rescue ProgramExceptions::ProgramException => e
          tell_user e.message
          tell_user nil
        rescue Exception => e
          tell_user [
            nil,
            nil,
            '!!!'.red,
            '!!! RUBY ERROR!'.red,
            "#{'!!!'.red} #{e.message}", '!!!'.red,
            e.backtrace.map{|m| "#{'!!!'.red} #{m}" },
            '!!!'.red
          ].flatten
        end
      end
    end
    # Closes the Program.
    #*******************************************************************************************************************
    def self.close
      tell_user "\n\nClosing program. See you next time.\n\n"
      Process.exit(1)
    end

end
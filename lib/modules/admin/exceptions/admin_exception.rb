module ProgramExceptions
  class AdminException < ProgramException
    def initialize(message)
      @message = ('Admin Error: ' + message).red
    end
  end
end
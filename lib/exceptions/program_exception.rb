module ProgramExceptions
  class ProgramException < Exception
    attr_accessor :message
    def initialize(message)
      @message = ('General Error: ' + message).red
    end
  end
end
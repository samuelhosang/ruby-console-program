module Console
  require 'colorize'

  # Displays information to the user.
  #*********************************************************************************************************************
  def tell_user(message, stdout: $stdout)
    stdout.puts message
  end
  # Gets input from the user.
  #*********************************************************************************************************************
  def user_input
    print '>> '.yellow
    case raw_input = gets.chomp
      when 'c', 'cancel' then tell_user "\n";raise ProgramExceptions::Cancel.new
      else
        tell_user "\n"
        return raw_input
    end

  rescue Interrupt;raise ProgramExceptions::Exit.new
  end
  # Confirms an action with the user.
  # Returns a boolean.
  #*********************************************************************************************************************
  def confirm(message='Are you sure?')
    boolean = nil
    while boolean.nil?
      tell_user message
      case (input = user_input)
        when 'y', 'yes' then boolean = true
        when 'n', 'no' then boolean = false
        else tell_user "Invalid option: '#{input}'"
      end
    end
    boolean
  end
  # Displays an array in a formatted way.
  #*********************************************************************************************************************
  def display_array(messages)
    max_length = messages.map{|m| m.nil? ? '' : m.uncolorize }.max_by(&:length).length
    breaker = ('-'*max_length).green
    messages.each do |msg|
      if msg.nil?
        tell_user breaker
      elsif msg[0] == '-' && msg[-1] == '-'
        msg = msg[1..-2]
        extra_space = (max_length - msg.uncolorize.length) / 2
        extra_space = 1 if extra_space < 1
        spacer = '-'*extra_space
        if msg.colorized?
          tell_user "#{spacer.green}#{msg}#{ (max_length-msg.length)%2 == 1 ? (spacer+'-').green : spacer.green }"
        else
          tell_user "#{spacer}#{msg}#{spacer}".green
        end
      else
        tell_user msg
      end
    end
    tell_user "\n"
  end

end
class Admin::New < Command

  def run
    args_required
    type = args.shift
    name = args.shift
    raise ProgramExceptions::UnknownObject.new(type) unless %w`command`.include?(type)
    raise ProgramExceptions::InvalidName.new if name.nil? || name == ''
    Admin::Generator.new(type, name, args)
  end

end
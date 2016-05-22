class Admin::New < Command

  def run
    args_required
    type = args.shift
    name = args.shift
    Admin::Generator.new(type, name, args)
  end

end
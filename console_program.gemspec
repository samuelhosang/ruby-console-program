Gem::Specification.new do |s|
  s.name        = 'console_program'
  s.version     = '0.0.0'
  s.date        = '2016-05-22'
  s.summary     = 'API for creating console games.'
  s.description = 'API for creating console games.'
  s.authors     = ['Sam Hosang']
  s.license     = 'MIT'
  s.email       = 'sam.t.m.hosang@gmail.com'
  s.homepage    = ''
  s.files       = %w(
    lib/console_program.rb
    lib/console.rb
    lib/commands/command.rb
    lib/commands/program/clear.rb
    lib/commands/program/exit.rb
    lib/commands/program/help.rb
    lib/commands/program/quit.rb
    lib/commands/program/reload.rb
    lib/exceptions/program_exception.rb
    lib/extentions/string.rb
    lib/exceptions/program_exception/argument_error.rb
    lib/exceptions/program_exception/argument_type_error.rb
    lib/exceptions/program_exception/cancel.rb
    lib/exceptions/program_exception/command_not_found.rb
    lib/exceptions/program_exception/exit.rb
    lib/lib/processor.rb
    lib/lib/scopes.rb
    lib/modules/admin/admin.rb
    lib/modules/admin/commands/admin.rb
    lib/modules/admin/commands/new.rb
    lib/modules/admin/exceptions/admin_exception.rb
    lib/modules/admin/exceptions/invalid_name.rb
    lib/modules/admin/exceptions/unknown_object.rb
  )

  s.add_runtime_dependency 'colorize', '= 0.7.7'
end

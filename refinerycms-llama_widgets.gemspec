# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-llama_widgets'
  s.version           = '0.2.0'
  s.description       = 'Ruby on Rails Widgets extension for Refinery CMS'
  s.date              = '2013-09-06'
  s.summary           = 'Widgets extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"]
  s.authors           = 'Nick Bolt'

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.1.0'
  s.add_dependency             'refinerycms-nested_models' 
  s.add_dependency             'slim-rails'
  s.add_dependency             'deface',              '~> 1.0.0'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.1.0'
end

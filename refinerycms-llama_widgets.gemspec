# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-llama_widgets'
  s.version           = '0.3.7'
  s.description       = 'Ruby on Rails Widgets extension for Refinery CMS'
  s.summary           = 'Widgets extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"]
  s.authors           = ['Nick Bolt', 'Daniel King']

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',          '~> 3.0.0'
  s.add_dependency             'refinerycms-nested_models', '~> 0.1.1'
  s.add_dependency             'slim-rails'
  s.add_dependency             'deface',                    '~> 1.0.0'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.1.0'
end

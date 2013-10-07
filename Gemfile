source "http://rubygems.org"

gemspec

gem 'refinerycms', '~> 2.1.0'
gem 'refinerycms-nested_models',
  :git => 'https://github.com/llamadigital/refinerycms-nested_models.git'

# Database Configuration
platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'activerecord-jdbcmysql-adapter'
  gem 'activerecord-jdbcpostgresql-adapter'
  gem 'jruby-openssl'
end

platforms :ruby do
  gem 'sqlite3'
end

group :development, :test do
  gem 'refinerycms-testing', '~> 2.1.0'
  gem 'faker'
  gem 'guard-rspec'

  platforms :ruby do
    require 'rbconfig'
    if RbConfig::CONFIG['target_os'] =~ /linux/i
      gem 'therubyracer', '~> 0.11.4'
    end
  end
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'rubyzip', '~> 0.9.9'

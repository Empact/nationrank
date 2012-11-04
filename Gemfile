source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#Server
gem 'pg'
gem 'thin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', require: false, platforms: :ruby # required by less
  gem 'less-rails-bootstrap'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'kaminari'
gem 'friendly_id'
gem 'foreigner'
gem 'sorcery'
gem 'strong_parameters'
gem 'simple_form'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :development do
  gem 'guard-spork'
  gem 'guard-bundler'
  gem 'guard-rspec'

  # gem 'guard-resque'
  # gem 'guard-sunspot'

  gem 'rb-fsevent'
  gem 'terminal-notifier-guard'
end

group :development, :test do
  # Dev
  # gem 'redis-namespace' # segregate redis values across multiple projects
  # gem 'sunspot_solr' # A pre-packaged version of solr

  # Debug
  # gem 'debugger', require: false

  # Test
  gem 'rspec-rails' # needed in development to run 'rake spec'
end

source 'https://rubygems.org'

gem 'rails', '4.0.2'
gem 'rails-api'
gem 'pg'
gem 'devise'
gem 'aes', '~> 0.5.0'

group :development do
  gem 'thin'
  gem 'quiet_assets'
  gem 'rack-cors'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'pry-rails'
end

group :test do
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner'
end

gem 'rails_12factor', group: :production

ruby "2.1.0"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

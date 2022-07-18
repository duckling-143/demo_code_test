source "https://rubygems.org"

ruby "3.1.0"
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"
gem 'jbuilder'
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

group :development, :test do
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rspec'
  gem 'rspec-rails'
end
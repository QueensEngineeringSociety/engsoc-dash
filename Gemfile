# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use devise for user authentication
gem 'devise'
# add bootstrap for styling
gem 'bootstrap-sass', '~> 3.3.6'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use ion icons throughout the application
gem 'ionicons-rails'
# Use font awesome throughtout the application
gem 'font-awesome-rails'
# Used in centric javascript library
gem 'jquery-validation-rails'
# Used in centric javascript library
gem 'rails-jquery-steps'
# Fixes binding events caused by turbolinks
gem 'jquery-turbolinks'
# Used in centric
gem 'select2-rails'
# Use cancancan for authorization within the application
gem 'cancancan'
# use pagination for various different views
gem 'figaro'
gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap'
# Calendar for interviews
gem 'simple_calendar', '~> 2.0'
# for uploading resumes & validating their size
gem 'carrierwave'
gem 'carrierwave-i18n'
gem 'file_validators'
gem 'rubocop', require: false
# Generate fake users & posts - this should be in dev test env...
gem 'byebug', platform: :mri
gem 'faker', '~> 1.7.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.6'
end

# gems only for development enviroment
group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  # gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # gem 'better_errors', '~> 2.1', '>= 2.1.1'
  gem 'binding_of_caller', '~> 0.7.2'
end

group :test do
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

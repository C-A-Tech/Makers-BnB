# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'bcrypt', '3.1.13'
gem 'pg'
gem 'puma'
gem 'rack'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'mailslurp_client', '~> 8.3', '>= 8.3.0'

group :development do
  gem 'shotgun'
  gem 'sinatra-reloader'
end

group :test do
  gem 'capybara'
  gem 'coveralls_reborn', '~> 0.20.0', require: false
  gem 'launchy', '~> 2.5'
  gem 'rspec'
  gem 'rubocop', '0.79.0'
  gem 'selenium-webdriver', '3.142.7'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'webdrivers', '4.6.0'
end

gem 'sinatra-flash', '~> 0.3.0'

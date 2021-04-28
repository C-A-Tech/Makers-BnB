# frozen_string_literal: true

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require_relative './setup_test_database' ### ADDED BY JESS 9am Wed
require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = BDE

ENV['RACK_ENV'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console,
                                                                 SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start

# Capybara.app = 'application'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  # ADDED IN BY JESS to clear out USERS table and remake it for every test
  config.before(:each) do
    setup_test_database
  end
  # ADDED IN BY JESS to clear out USERS table and remake it for every test
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

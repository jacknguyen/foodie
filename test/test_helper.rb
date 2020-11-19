ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'capybara/rails'
require 'capybara/minitest'
require 'minitest/rails'
require 'vcr'
require 'database_cleaner-mongoid'

Capybara.default_driver = :selenium_headless

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = false
  config.cassette_library_dir = 'test/support/vcr_cassettes'
  config.hook_into :webmock
  config.ignore_localhost = true
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Minitest::Assertions
  setup do
    ActionController::Base.allow_forgery_protection = true
  end

  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
    ActionController::Base.allow_forgery_protection = false
  end
end

class ActiveSupport::TestCase
  DatabaseCleaner.strategy = :truncation

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  setup do
    DatabaseCleaner.start
  end

  teardown do
    DatabaseCleaner.clean
  end

  # Add more helper methods to be used by all tests here...
  def self.test(test_name, &block)
    return super unless block_given?

    cassette = [name, test_name].map do |str|
      str.underscore.gsub(/[^A-Z]+/i, '_')
    end.join('/')

    super(test_name) do
      VCR.use_cassette(cassette) do
        instance_eval(&block)
      end
    end
  end
end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'capybara/rails'
require 'capybara/minitest'
require 'vcr'

Capybara.default_driver = :selenium_chrome_headless

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  # Make `assert_*` methods behave like Minitest assertions
  include Capybara::Minitest::Assertions

  # Reset sessions and driver between tests
  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = false
  config.cassette_library_dir = 'test/support/vcr_cassettes'
  config.hook_into :webmock
  config.ignore_localhost = true
end

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

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

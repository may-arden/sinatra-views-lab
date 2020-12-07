require_relative '../config/environment.rb'
require 'rack/test'
RACK_ENV = "test"
ENV["RACK_ENV"] = "test"

RSpec.configure do |config|
	config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include Rack::Test::Methods

  config.order = 'default'
end

def app
  Rack::Builder.parse_file('config.ru').first
end

# Load RSpec and Capybara
require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'

# Configure RSpec
RSpec.configure do |config|
  # Mixin the Capybara functionality into Rspec
  config.include Capybara::DSL
  config.order = 'default'
end

# Define the application we're testing
def app
  # Load the application defined in config.ru
  Rack::Builder.parse_file('config.ru').first
end

# Configure Capybara to test against the application above.
Capybara.app = app 


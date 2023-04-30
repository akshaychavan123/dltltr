# spec/rails_helper.rb

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

# Add additional requires below this line. Rails is not loaded until this point!
require 'capybara/rspec'
require 'capybara/rails'
require 'devise'
# require 'database_cleaner/active_record'

# Require all support files
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Configure Capybara
Capybara.configure do |config|
  config.server = :puma, { Silent: true }
  config.default_driver = :rack_test
  config.javascript_driver = :selenium_chrome_headless
  config.app_host = 'http://localhost:3000'
end


RSpec.configure do |config|
  # Include Devise test helpers
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Devise::Test::ControllerHelpers, type: :controller

  # Use transactions for database cleaning

 

  # Use the Capybara DSL
  config.include Capybara::DSL

  # Use FactoryBot syntax methods
  config.include FactoryBot::Syntax::Methods

  # Use the spec/support directory to load other helpers
  config.include Rails.application.routes.url_helpers
  config.include Warden::Test::Helpers

  # Load custom matchers
  Dir[Rails.root.join('spec/support/matchers/*.rb')].each { |f| require f }

  # Use the spec/support directory to load other helpers
  config.include Rails.application.routes.url_helpers

  # Use RSpec expect syntax
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = 'spec/examples.txt'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end



gfhmy,kjl.k;lk aksshay



end
  # Run specs in random order to surface order dependencies.
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  Kernel.srand config.seed
no merger and one more aaddition
end
akshay loves mrunal
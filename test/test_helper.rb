# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../test/dummy/config/environment.rb', __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path('../../test/dummy/db/migrate', __FILE__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path('../../db/migrate', __FILE__)

require 'pry'
require 'capybara'
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'simplecov'

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path('../fixtures', __FILE__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + '/files'
  ActiveSupport::TestCase.fixtures :all
end

Cell::TestCase.class_eval do
  include Capybara::DSL
  include Capybara::Assertions
end

ActionDispatch::IntegrationTest.class_eval do
  include Capybara::DSL
end

Bbs::ApplicationController.class_eval do
  class_attribute :current_user

  def current_user; self.class.current_user end

  def authenticate_user_for_test
    return if current_user

    redirect_to Bbs.config.login_path
  end

  helper_method :current_user
end

Bbs.configure do |config|
  config.authenticate_user = :authenticate_user_for_test
end

# save to CircleCI's artifacts directory if we're on CircleCI
if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], 'coverage')
  SimpleCov.coverage_dir(dir)
end

SimpleCov.start do
  add_filter '/vendor/'
end

require 'capybara'
require 'minitest/rails'
require 'minitest/rails/capybara'

Cell::TestCase.class_eval do
  include Capybara::DSL
  include Capybara::Assertions
end

ActionDispatch::IntegrationTest.class_eval do
  include Capybara::DSL
end

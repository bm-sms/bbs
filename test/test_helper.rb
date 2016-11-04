require 'pry'
require 'rails/test_help'
require 'helpers/login_helper'

ENV['RAILS_ENV'] = 'test'

Dir.glob(File.join(__dir__, 'config', '*.rb')) {|f| require_relative f }

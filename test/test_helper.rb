require 'pry'
require 'rails/test_help'

ENV['RAILS_ENV'] = 'test'

Dir.glob(File.join(__dir__, 'config', '*.rb')) {|f| require_relative f }

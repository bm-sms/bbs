require 'test_helper'

module Bbs
  class AuthenticatableTest < ActiveSupport::TestCase
    setup do
      Bbs.configure do |config|
        config.current_user = :actual_current_user
        config.authenticate_user = :actual_authenticate_user
      end
    end

    test 'can call current_user' do
      mock = MiniTest::Mock.new.expect(:actual_current_user, true)
      mock.class.include Bbs::Concerns::Authenticatable

      mock.current_user

      assert_mock mock
    end

    test 'raise NoMethodError if Bbs.config.current_user was undefined' do
      mock = MiniTest::Mock.new
      mock.class.include Bbs::Concerns::Authenticatable

      assert_raises { mock.current_user }
    end

    test 'can call authenticate_user' do
      mock = MiniTest::Mock.new.expect(:actual_authenticate_user, true)
      mock.class.include Bbs::Concerns::Authenticatable

      mock.authenticate_user

      assert_mock mock
    end

    test 'raise NoMethodError if Bbs.config.authenticate_user was undefined' do
      mock = MiniTest::Mock.new
      mock.class.include Bbs::Concerns::Authenticatable

      assert_raises { mock.authenticate_user }
    end

    teardown do
      Bbs.configure do |config|
        config.current_user = :current_user
        config.authenticate_user = :authenticate_user_for_test
      end
    end
  end
end

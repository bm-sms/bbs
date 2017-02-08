require 'test_helper'

class ProfileTest < ActionDispatch::IntegrationTest
  include Bbs::Engine.routes.url_helpers
  include ActionView::Helpers::TranslationHelper
  include LoginHelper

  fixtures 'users', 'user_profiles'

  test 'update user profile' do
    login_as :alice

    visit edit_profile_path

    choose "user_profile_avatar_id_#{Avatar.find_by(image_file_name: 'avatar2.jpg').id}"
    fill_in 'Nickname', with: 'New Nickname'

    click_button 'Update User profile'

    assert_equal 'New Nickname', users(:alice).profile.nickname
    assert_equal Avatar.find_by(image_file_name: 'avatar2.jpg'), users(:alice).profile.avatar
  end

  test 'create new user profile' do
    login_as :charlie

    visit edit_profile_path

    choose "user_profile_avatar_id_#{Avatar.find_by(image_file_name: 'avatar2.jpg').id}"
    fill_in 'Nickname', with: 'New Nickname'

    click_button 'Create User profile'

    assert_equal 'New Nickname', users(:charlie).profile.nickname
    assert_equal Avatar.find_by(image_file_name: 'avatar2.jpg'), users(:charlie).profile.avatar
  end

  teardown do
    logout
  end
end


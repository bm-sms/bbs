require 'test_helper'

class ProfileTest < ActionDispatch::IntegrationTest
  include Bbs::Engine.routes.url_helpers
  include ActionView::Helpers::TranslationHelper
  include LoginHelper

  fixtures 'bbs/users', 'bbs/user_profiles'

  test 'update user profile' do
    login_as :alice

    visit edit_profile_path

    choose "user_profile_avatar_id_#{Bbs::Avatar.find_by(image_file_name: 'avatar2.jpg').id}"
    fill_in 'Nickname', with: 'New Nickname'

    click_button 'Update User profile'

    assert_equal 'New Nickname', bbs_users(:alice).profile.nickname
    assert_equal Bbs::Avatar.find_by(image_file_name: 'avatar2.jpg'), bbs_users(:alice).profile.avatar
  end

  test 'create new user profile' do
    login_as :charlie

    visit edit_profile_path

    choose "user_profile_avatar_id_#{Bbs::Avatar.find_by(image_file_name: 'avatar2.jpg').id}"
    fill_in 'Nickname', with: 'New Nickname'

    click_button 'Create User profile'

    assert_equal 'New Nickname', bbs_users(:charlie).profile.nickname
    assert_equal Bbs::Avatar.find_by(image_file_name: 'avatar2.jpg'), bbs_users(:charlie).profile.avatar
  end

  teardown do
    logout
  end
end


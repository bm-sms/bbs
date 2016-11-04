require 'test_helper'

class TopicTest < ActionDispatch::IntegrationTest
  include Bbs::Engine.routes.url_helpers
  include ActionView::Helpers::TranslationHelper

  fixtures 'bbs/topics'

  test 'list topics when user are logged in' do
    visit category_topics_path(bbs_categories(:category1))

    assert has_link?(t('bbs.topics.index.new_topic'))

    bbs_categories(:category1).topics.each do |topic|
      assert has_text?(topic.title)
    end
  end

  test 'create a new topic' do
    Bbs::ApplicationController.current_user = bbs_users(:alice)

    visit category_topics_path(bbs_categories(:category1))

    click_link 'create a new topic'

    fill_in 'Title', with: 'New Topic'
    fill_in 'Topic body', with: 'New Topic body'

    click_button 'Create'

    assert Bbs::Topic.exists?(category: bbs_categories(:category1), title: 'New Topic', body: 'New Topic body')
  end

  teardown do
    Bbs::ApplicationController.current_user = nil
  end
end


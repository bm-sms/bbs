require 'test_helper'

class TopicTest < ActionDispatch::IntegrationTest
  include Bbs::Engine.routes.url_helpers
  include ActionView::Helpers::TranslationHelper

  fixtures 'bbs/topics'

  test 'list topics when user are logged in' do
    category = Bbs::Category.find_by(name: 'category1')

    visit category_topics_path(category)

    assert has_link?(t('bbs.topics.index.new_topic'))

    category.topics.each do |topic|
      assert has_text?(topic.title)
    end
  end
end


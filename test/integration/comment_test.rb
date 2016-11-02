require 'test_helper'

class CommentTest < ActionDispatch::IntegrationTest
  include Bbs::Engine.routes.url_helpers

  fixtures 'bbs/topics', 'bbs/comments'

  test 'list comments when user are logged in' do
    topic = Bbs::Topic.find_by(title: 'topic1')

    visit topic_comments_path(topic)

    assert has_content?(topic.title)

    topic.comments.each do |comment|
      assert has_content?(comment.title)
    end
  end
end


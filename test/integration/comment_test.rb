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

  test 'create a new comment' do
    Bbs::ApplicationController.current_user = Bbs::User.first
    topic = Bbs::Topic.find_by(title: 'topic1')

    visit topic_comments_path(topic)

    fill_in 'Title', with: 'New comment'
    fill_in 'Comment body', with: 'New comment body'

    click_button 'Post new comment'

    assert Bbs::Comment.exists?(topic: topic, title: 'New comment', body: 'New comment body')
  end

  teardown do
    Bbs::ApplicationController.current_user = nil
  end
end


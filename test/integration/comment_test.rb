require 'test_helper'

class CommentTest < ActionDispatch::IntegrationTest
  include Bbs::Engine.routes.url_helpers
  include LoginHelper

  fixtures 'bbs/topics', 'bbs/comments'

  test 'list comments when user are logged in' do
    visit topic_comments_path(bbs_topics(:topic1))

    assert has_content?(bbs_topics(:topic1).title)

    bbs_topics(:topic1).comments.each do |comment|
      assert has_content?(comment.title)
    end
  end

  test 'create a new comment' do
    login_as :alice

    visit topic_comments_path(bbs_topics(:topic1))

    fill_in 'Title', with: 'New comment'
    fill_in 'Comment body', with: 'New comment body'

    click_button 'Post new comment'

    assert Bbs::Comment.exists?(topic: bbs_topics(:topic1), title: 'New comment', body: 'New comment body')
  end

  teardown do
    logout
  end
end


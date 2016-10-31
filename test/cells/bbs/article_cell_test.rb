require 'test_helper'

class Bbs::ArticleCellTest < Cell::TestCase
  fixtures 'bbs/users'
  fixtures 'bbs/user_profiles'
  fixtures 'bbs/topics'
  fixtures 'bbs/comments'

  controller Bbs::ApplicationController

  test 'show topic' do
    topic = Bbs::Topic.first

    target = cell('bbs/article', topic).(:show)

    target.find('.bbs-article__title').must_have_text(topic.title)
    target.find('.bbs-article__body').must_have_text(topic.body)
    target.find('.bbs-article__author-name').must_have_text(topic.author.profile.nickname)
  end

  test 'show comment' do
    comment = Bbs::Comment.first

    target = cell('bbs/article', comment).(:show)

    target.find('.bbs-article__title').must_have_text(comment.title)
    target.find('.bbs-article__body').must_have_text(comment.body)
    target.find('.bbs-article__author-name').must_have_text(comment.author.profile.nickname)
  end
end

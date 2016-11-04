require 'test_helper'

class Bbs::ArticleCellTest < Cell::TestCase
  fixtures :all

  controller Bbs::ApplicationController

  test 'show a topic when user is not logged in' do
    topic = Bbs::Topic.first

    target = cell('bbs/article', topic).(:show)

    target.find('.bbs-article__title').must_have_text(topic.title)
    target.find('.bbs-article__body').must_have_text(topic.body.truncate_words(1))
    target.find('.bbs-article__author-name').must_have_text(topic.author.profile.nickname)
  end

  test 'show a comment when user is not logged in' do
    comment = Bbs::Comment.first

    target = cell('bbs/article', comment).(:show)

    target.find('.bbs-article__title').must_have_text(comment.title)
    target.find('.bbs-article__body').must_have_text(comment.body.truncate_words(1))
    target.find('.bbs-article__author-name').must_have_text(comment.author.profile.nickname)
  end

  test 'show a topic when user is logged in' do
    Bbs::ApplicationController.current_user = Bbs::User.first

    topic = Bbs::Topic.first

    target = cell('bbs/article', topic).(:show)

    target.find('.bbs-article__title').must_have_text(topic.title)
    target.find('.bbs-article__body').must_have_text(topic.body)
    target.find('.bbs-article__author-name').must_have_text(topic.author.profile.nickname)
  end

  teardown do
    Bbs::ApplicationController.current_user = nil
  end
end

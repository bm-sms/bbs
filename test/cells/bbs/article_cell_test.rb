require 'test_helper'

class Bbs::ArticleCellTest < Cell::TestCase
  include LoginHelper

  fixtures :all

  controller Bbs::ApplicationController

  test 'show a topic when user is not logged in' do
    target = cell('bbs/article', bbs_topics(:topic1)).(:show)

    target.find('.bbs-article__title').must_have_text(bbs_topics(:topic1).title)
    target.find('.bbs-article__body').must_have_text(bbs_topics(:topic1).body.truncate_words(1))
    target.find('.bbs-article__author-name').must_have_text(bbs_topics(:topic1).author.profile.nickname)
  end

  test 'show a comment when user is not logged in' do
    target = cell('bbs/article', bbs_comments(:comment1)).(:show)

    target.find('.bbs-article__title').must_have_text(bbs_comments(:comment1).title)
    target.find('.bbs-article__body').must_have_text(bbs_comments(:comment1).body.truncate_words(1))
    target.find('.bbs-article__author-name').must_have_text(bbs_comments(:comment1).author.profile.nickname)
  end

  test 'show a topic when user is logged in' do
    login_as :alice

    target = cell('bbs/article', bbs_topics(:topic1)).(:show)

    target.find('.bbs-article__title').must_have_text(bbs_topics(:topic1).title)
    target.find('.bbs-article__body').must_have_text(bbs_topics(:topic1).body)
    target.find('.bbs-article__author-name').must_have_text(bbs_topics(:topic1).author.profile.nickname)
  end

  teardown do
    logout
  end
end

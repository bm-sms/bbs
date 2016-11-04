require 'test_helper'

class Bbs::LatestTopicsCellTest < Cell::TestCase
  controller Bbs::ApplicationController

  test 'show' do
    target = cell('bbs/latest_topics').(:show)

    Bbs::Topic.all.map(&:title).each do |title|
      target.must_have_text title
    end
  end
end

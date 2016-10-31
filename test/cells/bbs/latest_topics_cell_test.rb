require 'test_helper'

class Bbs::LatestTopicsCellTest < Cell::TestCase
  controller Bbs::ApplicationController

  test "show" do
    cell('bbs/latest_topics').(:show)
  end
end

require 'test_helper'

class LatestTopicsCellTest < Cell::TestCase
  test "show" do
    html = cell("latest_topics").(:show)
    assert html.match /<p>/
  end
end

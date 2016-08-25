require 'test_helper'

class ArticleCellTest < Cell::TestCase
  test "show" do
    html = cell("article").(:show)
    assert html.match /<p>/
  end


end

require 'test_helper'

class CategoryCellTest < Cell::TestCase
  test "show" do
    html = cell("category").(:show)
    assert html.match /<p>/
  end


end

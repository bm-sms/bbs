require 'test_helper'

class Bbs::CategoryCellTest < Cell::TestCase
  fixtures 'bbs/categories'

  controller Bbs::ApplicationController

  test 'show' do
    target = cell('bbs/category').()

    target.must_have_css 'li.bbs-category-item[data-category=category1]'
    target.must_have_css 'li.bbs-category-item[data-category=category2]'
  end
end

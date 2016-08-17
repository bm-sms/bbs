module Bbs
  class CategoryCell < ApplicationCell
    def show
      @categories = Bbs::Category.all

      render
    end
  end
end

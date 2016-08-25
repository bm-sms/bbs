module Bbs
  class ArticleCell < ApplicationCell
    property :title
    property :body
    property :created_at

    def show
      render
    end
  end
end

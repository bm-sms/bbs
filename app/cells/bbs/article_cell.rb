module Bbs
  class ArticleCell < ApplicationCell
    property :author
    property :title
    property :body
    property :created_at

    def show
      render
    end

    def nickname
      author.profile.nickname
    end

    def avatar_url
      author.profile.avatar.avatar.url(:medium)
    end
  end
end

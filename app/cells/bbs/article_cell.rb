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
      author.profile.nickname || t('.noname')
    end

    def avatar_url
      author.profile.avatar.avatar.url(:medium) || 'http://ruminate.branhamroys.com/wp-content/uploads/2015/07/unknown.gif'
    end
  end
end

module Bbs
  class ArticleCell < ApplicationCell
    property :title
    property :body
    property :created_at

    def show
      render
    end

    def nickname
      current_user.profile&.nickname || t('.noname')
    end

    def avatar_url
      current_user.profile&.avatar_url || 'http://ruminate.branhamroys.com/wp-content/uploads/2015/07/unknown.gif'
    end
  end
end

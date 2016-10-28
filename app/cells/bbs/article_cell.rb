module Bbs
  class ArticleCell < ApplicationCell
    property :author
    property :title
    property :body
    property :created_at

    def show
      render
    end

    def article_body
      return body if logged_in? || !Bbs.config.clamp_article_body

      body.truncate([body.truncate_words(1).length, Bbs.config.clamp_article_body].min)
    end

    def nickname
      author.profile.nickname
    end

    def avatar_url
      author.profile.avatar.image.url(:medium)
    end
  end
end

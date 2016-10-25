module Bbs
  class Configuration
    attr_accessor :clamp_article_body, :login_path, :latest_topics_count,
                  :topics_per_page, :comments_per_page

    def clamp_article_body
      @clamp_article_body ||= 100
    end

    def login_path
      @login_path ||= '/'
    end

    def latest_topics_count
      @latest_topics_count ||= 10
    end

    def topics_per_page
      @topics_per_page ||= 10
    end

    def comments_per_page
      @comments_per_page ||= 10
    end
  end
end

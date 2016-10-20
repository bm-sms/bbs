module Bbs
  class Configuration
    attr_accessor :clamp_article_body, :login_path

    def clamp_article_body
      @clamp_article_body ||= 100
    end

    def login_path
      @login_path ||= '/'
    end
  end
end

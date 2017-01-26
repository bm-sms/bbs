module Bbs
  class Configuration
    attr_accessor :clamp_article_body, :login_path, :latest_topics_count,
                  :topics_per_page, :comments_per_page, :current_user,
                  :authenticate_user, :user_class, :user_profile_class, :avatar_class

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

    def user_class; @user_class.constantize end
    def user_class_name; @user_class end

    def user_profile_class; @user_profile_class.constantize end
    def user_profile_class_name; @user_profile_class end

    def avatar_class; @avatar_class.constantize end
    def avatar_class_name; @avatar_class end

    def current_user
      @current_user ||= :current_user
    end

    def authenticate_user
      @authenticate_user ||= :authenticate_user!
    end
  end
end

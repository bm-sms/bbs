Bbs::ApplicationController.class_eval do
  class_attribute :current_user

  def current_user; self.class.current_user end

  def authenticate_user_for_test
    return if current_user

    redirect_to Bbs.config.login_path
  end

  helper_method :current_user
end

Bbs.configure do |config|
  config.authenticate_user = :authenticate_user_for_test
end

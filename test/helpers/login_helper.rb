module LoginHelper
  def login_as(user_name)
    Bbs::ApplicationController.current_user = bbs_users(user_name)
  end

  def logout
    Bbs::ApplicationController.current_user = nil
  end
end
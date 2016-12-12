module Bbs
  class ApplicationController < ::ApplicationController
    include Bbs::Concerns::Authenticatable

    protect_from_forgery with: :exception

    layout 'layouts/application'

    def logged_in?; current_bbs_user end

    helper_method :logged_in?, :current_bbs_user
  end
end

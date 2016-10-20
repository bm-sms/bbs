module Bbs
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    layout 'layouts/application'

    def logged_in?; current_user end

    helper_method :logged_in?
  end
end

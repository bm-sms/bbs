module Bbs
  module ApplicationHelper
    def bbs_engine
      Bbs::Engine.routes.url_helpers
    end
  end
end

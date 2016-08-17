module Bbs
  class ApplicationCell < Cell::ViewModel
    include Cell::Hamlit
    include ActionView::Helpers::UrlHelper

    delegate :bbs, :main_app, :current_user, to: :parent_controller

    self.view_paths = [Bbs::Engine.root.join('app/cells').to_s]
  end
end

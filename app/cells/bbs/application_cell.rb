module Bbs
  class ApplicationCell < Cell::ViewModel
    include ActionView::Helpers::FormHelper
    include ActionView::Helpers::FormOptionsHelper
    include ActionView::Helpers::UrlHelper
    include ActionView::RecordIdentifier
    include Cell::Hamlit

    delegate :bbs, :main_app, :current_user, to: :parent_controller

    self.view_paths = [Bbs::Engine.root.join('app/cells').to_s]
  end
end

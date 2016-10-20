module Bbs
  class ApplicationCell < Cell::ViewModel
    include ActionView::Helpers::FormHelper
    include ActionView::Helpers::FormOptionsHelper
    include ActionView::Helpers::TranslationHelper
    include ActionView::Helpers::UrlHelper
    include ActionView::RecordIdentifier
    include Cell::Hamlit
    include Cell::Translation

    self.view_paths = [Bbs::Engine.root.join('app/cells').to_s]

    def method_missing(method, *args, &block)
      super and return unless parent_controller.respond_to?(method)

      parent_controller.__send__ method, *args, &block
    end
  end
end

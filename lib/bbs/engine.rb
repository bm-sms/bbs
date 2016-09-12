require 'cells-rails'
require 'cells-hamlit'
require 'kaminari'
require 'rails-i18n'

module Bbs
  class Engine < ::Rails::Engine
    isolate_namespace Bbs

    config.to_prepare do
      Dir.glob(Rails.root + 'app/engines/**/*.rb').each do |c|
        require_dependency(c)
      end
    end
  end
end

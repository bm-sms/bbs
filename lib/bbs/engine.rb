require 'cells-rails'
require 'cells-hamlit'
require 'jquery-rails'
require 'kaminari'
require 'rails-assets-infinite-scroll'
require 'rails-i18n'

module Bbs
  class Engine < ::Rails::Engine
    isolate_namespace Bbs

    config.to_prepare do
      Dir.glob(Rails.root + 'app/engines/**/*.rb').each do |c|
        require_dependency(c)
      end
    end

    ActiveSupport.run_load_hooks :bbs_engine, Bbs::Engine
  end
end

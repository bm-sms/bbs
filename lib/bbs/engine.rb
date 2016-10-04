require 'cells-rails'
require 'cells-hamlit'
require 'gretel'
require 'kaminari'
require 'paperclip'
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

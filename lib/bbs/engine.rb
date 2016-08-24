require 'cells-rails'
require 'cells-hamlit'
require 'kaminari'
require 'rails-i18n'

module Bbs
  class Engine < ::Rails::Engine
    isolate_namespace Bbs
  end
end

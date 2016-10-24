require 'rails/generators/base'

module Bbs
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root Bbs::Engine.root.join('app/views/bbs').to_s

      def copy_views
        %w(comments profiles shared topics).each do |resource|
          directory resource, "app/views/bbs/#{resource}"
        end
      end
    end
  end
end

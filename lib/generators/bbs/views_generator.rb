require 'rails/generators/base'

module Bbs
  module Generators
    class ResourcesViewsGenerator < Rails::Generators::Base
      hide!

      source_root Bbs::Engine.root.join('app/views/bbs').to_s

      def copy_views
        %w(comments profiles shared topics).each do |resource|
          directory resource, "app/views/bbs/#{resource}"
        end
      end
    end

    class CellsViewsGenerator < Rails::Generators::Base
      hide!

      source_root Bbs::Engine.root.join('app/cells/bbs').to_s

      def copy_views
        %w(article category latest_topics).each do |cell|
          directory cell, "app/cells/bbs/#{cell}"
        end
      end
    end

    class ViewsGenerator < Rails::Generators::Base
      invoke Bbs::Generators::ResourcesViewsGenerator
      invoke Bbs::Generators::CellsViewsGenerator
    end
  end
end

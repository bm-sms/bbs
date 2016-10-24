require 'rails/generators/base'

module Bbs
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root Bbs::Engine.root.join('config/locales').to_s

      def copy_locales
        %w(bbs.en.yml bbs.ja.yml).each do |locale|
          copy_file locale, "config/locales/#{locale}"
        end
      end
    end
  end
end

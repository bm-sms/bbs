require 'rails/generators/base'

module Bbs
  module Generators
    class InitializerGenerator < Rails::Generators::Base
      hide!

      source_root File.expand_path('../templates', __FILE__)

      def copy_initialier
        binding.pry
        copy_file 'bbs.rb', 'config/initializers/bbs.rb'
      end
    end

    class LocaleGenerator < Rails::Generators::Base
      hide!

      source_root Bbs::Engine.root.join('config/locales').to_s

      def copy_locales
        %w(bbs.en.yml bbs.ja.yml).each do |locale|
          copy_file locale, "config/locales/#{locale}"
        end
      end
    end

    class ConfigGenerator < Rails::Generators::Base
      invoke InitializerGenerator
      invoke LocaleGenerator
    end
  end
end

require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class BbsGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def generate_user
        return unless invoke?

        invoke('active_record:model', [@name]) unless model_file_exists?(@name) # we need blank User model
        inject_into_user
      end

      def generate_user_profile
        return unless invoke?

        migration_template user_profile_migration_filename, "db/migrate/#{user_profile_migration_filename}"
        template 'user_profile.rb', 'app/models/user_profile.rb' unless model_file_exists?('UserProfile')
      end

      def generate_avatar
        return unless invoke?

        migration_template avatar_migration_filename, "db/migrate/#{avatar_migration_filename}"
        template 'avatar.rb', 'app/models/avatar.rb' unless model_file_exists?('Avatar')
      end

      private

      def inject_into_user
        inject_into_class model_path(@name), @name do
          <<-RUBY
  has_one :profile, class_name: 'UserProfile', dependent: :destroy

  accepts_nested_attributes_for :profile

  validates_associated :profile
  validates_presence_of :profile
          RUBY
        end
      end

      def invoke?; behavior == :invoke end

      def model_exists?(const)
        Object.const_defined?(const) && const.constantize.ancestors.include?(ActiveRecord::Base)
      end

      def model_file_exists?(const)
        File.exist?(model_path(const))
      end

      def user_profile_migration_filename
        model_exists?('UserProfile') ? 'change_profile.rb' : 'create_profile.rb'
      end

      def avatar_migration_filename
        model_exists?('Avatar') ? 'change_avatar.rb' : 'create_avatar.rb'
      end

      def model_path(model_name)
        Rails.root.join('app', 'models', "#{model_name.underscore}.rb")
      end

      def user_model_name; @name.underscore end
    end
  end
end

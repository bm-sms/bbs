module Bbs
  module Concerns
    module Authenticatable
      extend ActiveSupport::Concern

      included do
        unless public_instance_methods.include?(Bbs.config.current_user)
          define_method(:current_user) do
            __send__ Bbs.config.current_user
          end
        end

        unless public_instance_methods.include?(Bbs.config.authenticate_user)
          define_method(:authenticate_user!) do
            __send__ Bbs.config.authenticate_user
          end
        end
      end
    end
  end
end

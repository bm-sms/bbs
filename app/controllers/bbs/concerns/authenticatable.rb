module Bbs
  module Concerns
    module Authenticatable
      extend ActiveSupport::Concern

      included do
        define_method(:current_bbs_user) do
          raise NoMethodError, "undefined method #{Bbs.config.current_user} in #{self.class.to_s}." unless respond_to?(Bbs.config.current_user)

          __send__ Bbs.config.current_user
        end

        define_method(:authenticate_bbs_user) do
          raise NoMethodError, "undefined method #{Bbs.config.authenticate_user} in #{self.class.to_s}." unless respond_to?(Bbs.config.authenticate_user)

          __send__ Bbs.config.authenticate_user
        end
      end
    end
  end
end

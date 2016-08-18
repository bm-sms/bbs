module Bbs
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    def self.permitted_attributes
      self.attribute_names.without('id', 'created_at', 'updated_at')
    end
  end
end

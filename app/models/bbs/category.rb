module Bbs
  class Category < ::Bbs::ApplicationRecord
    has_many :topics, class_name: 'Bbs::Topic'
  end
end

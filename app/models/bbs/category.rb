module Bbs
  class Category < ::Bbs::ApplicationRecord
    has_many :topics
  end
end

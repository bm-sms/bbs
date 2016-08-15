module Bbs
  class Category < ApplicationRecord
    has_many :topics
  end
end

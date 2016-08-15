module Bbs
  class Topic < ApplicationRecord
    belongs_to :category
  end
end

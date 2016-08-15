module Bbs
  class Topic < ApplicationRecord
    has_many :comments

    belongs_to :category
  end
end

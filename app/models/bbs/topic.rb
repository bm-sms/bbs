module Bbs
  class Topic < ApplicationRecord
    has_many :comments

    belongs_to :category
    belongs_to :author, class_name: Bbs.author_class
  end
end

module Bbs
  class Comment < ApplicationRecord
    belongs_to :topic
    belongs_to :author, class_name: Bbs.author_class
  end
end

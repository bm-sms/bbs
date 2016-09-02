module Bbs
  class Topic < ::Bbs::ApplicationRecord
    has_many :comments

    belongs_to :category
    belongs_to :author, class_name: Bbs::User
  end
end

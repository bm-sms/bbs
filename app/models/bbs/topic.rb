module Bbs
  class Topic < ::Bbs::ApplicationRecord
    has_many :comments, class_name: 'Bbs::Comment'

    belongs_to :category, class_name: 'Bbs::Category'
    belongs_to :author, class_name: 'Bbs::User'

    validates :title, :body, presence: true, allow_blank: false
  end
end

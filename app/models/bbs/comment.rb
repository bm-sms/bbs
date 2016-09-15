module Bbs
  class Comment < ::Bbs::ApplicationRecord
    belongs_to :topic, class_name: 'Bbs::Topic'
    belongs_to :author, class_name: 'Bbs::User'

    validates :title, :body, presence: true, allow_blank: false
  end
end

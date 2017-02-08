module Bbs
  class Comment < ::Bbs::ApplicationRecord
    belongs_to :topic, class_name: 'Bbs::Topic'
    belongs_to :author, class_name: "::#{Bbs.config.user_class_name}"

    validates :title, :body, presence: true, allow_blank: false
  end
end

module Bbs
  class UserProfile < ApplicationRecord
    belongs_to :user, class_name: 'Bbs::User'
    belongs_to :avatar, class_name: 'Bbs::Avatar'

    validates :avatar_id, :nickname, presence: true, allow_blank: false
  end
end

module Bbs
  class UserProfile < ApplicationRecord
    belongs_to :user, class_name: 'Bbs::User'

    validates :avatar_url, :nickname, presence: true, allow_blank: false
  end
end

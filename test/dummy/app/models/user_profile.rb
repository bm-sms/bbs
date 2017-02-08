class UserProfile < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :avatar, class_name: 'Avatar'

  validates :avatar_id, :nickname, presence: true, allow_blank: false
end

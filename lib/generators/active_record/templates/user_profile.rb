class UserProfile < ApplicationRecord
  belongs_to :<%= user_model_name %>, class_name: <%= @name %>
  belongs_to :avatar, class_name: 'Avatar'

  validates :avatar_id, :nickname, presence: true, allow_blank: false
end

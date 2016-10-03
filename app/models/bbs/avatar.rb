module Bbs
  class Avatar < ApplicationRecord
    has_many :user_profiles, class_name: 'Bbs::UserProfile'

    has_attached_file :avatar, styles: {medium: '48x48>', thumb: '48x48>'}

    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  end
end

class Avatar < ApplicationRecord
  has_many :user_profiles, class_name: 'UserProfile'

  has_attached_file :image, styles: {medium: '48x48>', thumb: '48x48>'}

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end

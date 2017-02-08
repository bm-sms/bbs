class User < ApplicationRecord
  has_one :profile, class_name: 'UserProfile', dependent: :destroy

  accepts_nested_attributes_for :profile

  validates_associated :profile
  validates_presence_of :profile
end

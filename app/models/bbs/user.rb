module Bbs
  class User < ApplicationRecord
    has_one :profile, class_name: 'Bbs::UserProfile', dependent: :destroy

    accepts_nested_attributes_for :profile
  end
end

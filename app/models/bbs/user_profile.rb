module Bbs
  class UserProfile < ApplicationRecord
    belongs_to :user, class_name: 'Bbs::User'
  end
end

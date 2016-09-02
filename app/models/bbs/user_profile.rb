module Bbs
  class UserProfile < ApplicationRecord
    belongs_to :user
  end
end

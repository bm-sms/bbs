module Bbs
  class User < ApplicationRecord
    has_one :profile, class_name: 'Bbs::UserProfile'
  end
end

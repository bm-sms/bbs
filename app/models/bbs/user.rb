module Bbs
  class User < ApplicationRecord
    has_one :profile
  end
end

module Bbs
  class Avatar < ApplicationRecord
    has_attached_file :avatar, styles: {medium: '48x48'}

    validates_attachment :avatar, content_type: {content_type: %w('image/jpg' 'image/jpeg' 'image/png' 'image/gif')}
  end
end

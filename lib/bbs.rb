require 'bbs/engine'

module Bbs
  mattr_accessor :author_class

  def author_class
    @@author_class.to_s.classify.constantize
  end

  module_function :author_class
end

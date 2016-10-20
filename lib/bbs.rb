require 'bbs/engine'
require 'bbs/configuration'

module Bbs
  mattr_accessor :config

  def config
    @config ||= Bbs::Configuration.new
  end

  def configure
    yield(config)
  end

  module_function :config, :configure
end

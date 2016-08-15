$:.push File.expand_path('../lib', __FILE__)

require 'bbs/version'

Gem::Specification.new do |s|
  s.name        = 'bbs'
  s.version     = Bbs::VERSION
  s.authors     = ['nobody']
  s.email       = ['nobody@bm-sms.co.jp']
  s.homepage    = ''
  s.summary     = 'Summary of Bbs.'
  s.description = 'Description of Bbs.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.0.0', '>= 5.0.0.1'

  s.add_development_dependency 'pg'
end

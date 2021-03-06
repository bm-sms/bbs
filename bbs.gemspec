$:.push File.expand_path('../lib', __FILE__)

require 'bbs/version'

Gem::Specification.new do |s|
  s.name        = 'bbs'
  s.version     = Bbs::VERSION
  s.authors     = ['']
  s.email       = ['jp.bm-sms.developers@bm-sms.jp']
  s.homepage    = ''
  s.summary     = 'Summary of Bbs.'
  s.description = 'Description of Bbs.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.0.0', '>= 5.0.0.1'
  s.add_dependency 'bourbon'
  s.add_dependency 'cells-hamlit'
  s.add_dependency 'cells-rails'
  s.add_dependency 'gretel'
  s.add_dependency 'kaminari'
  s.add_dependency 'paperclip'
  s.add_dependency 'rails-i18n'

  s.add_development_dependency 'minitest-rails-capybara'
  s.add_development_dependency 'pg'
  s.add_development_dependency 'pry-byebug'
  s.add_development_dependency 'simplecov'
end

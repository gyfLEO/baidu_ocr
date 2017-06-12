Gem::Specification.new do |s|
  s.name = 'ocr'
  s.version = '1.0.0'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A Ruby interface to the Ocr_Recog API.'
  s.description = 'http://ai.baidu.com/docs'
  s.homepage = 'https://rubygems.org/gems/ocr'
  s.licenses = ['MIT']
  s.authors = ['baidu_ai', 'leo']
  s.email = ['1336126917@qq.com']
  # s.files =['LICENSE']
  s.files += Dir.glob 'lib/**/*.rb'
  # s.files += Dir.glob 'spec/**/*'
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec'
end
Gem::Specification.new do |s|
  s.name        = 'hecks'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = 'Use Hecks to generate domains'
  s.description = 'Hecks uses DDD and Hexagonal architecture to build and deploy domains'
  s.authors     = ['Hecks Developer']
  s.email       = 'support@the_good_guys.com'
  s.files       = Dir['{lib, bin}/**/*']
  s.executables = ['hecks']
  s.homepage    = 'http://www.example.com'

  s.add_dependency 'hecks-adapters-dynamodb', '0.1.0'
  s.add_dependency 'hecks-app', '0.1.0'
  s.add_dependency 'hecks-domain', '0.1.0'
  s.add_dependency 'soccer_season', '0.1.0'
end

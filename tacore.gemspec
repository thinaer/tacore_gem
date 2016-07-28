Gem::Specification.new do |s|
  s.name        = 'TACore'
  s.version     = '3.5.6'
  s.date        = '2016-06-02'
  s.summary     = "ThinAer Core API"
  s.description = "This allows access to the TA Core API"
  s.authors     = ["Greg Winn"]
  s.email       = 'greg.winn@thinaer.io'
  s.files       = ["lib/tacore.rb", "lib/exceptions.rb", "lib/tacore/client.rb",
                  "lib/tacore/venue.rb", "lib/tacore/device.rb", "lib/tacore/scan.rb",
                  "lib/tacore/movement.rb"]
  s.homepage    = 'http://thinaer.io'
  s.license     = 'None'
  s.add_dependency("oauth2", "~>1.1.0")
  s.add_development_dependency "rspec"
end

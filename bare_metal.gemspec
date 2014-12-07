Gem::Specification.new do |s|
  s.name = "bare_metal"
  s.version = "0.0.1"
  s.description = 'A toolkit for simple machine bootstrapping.'
  s.summary = ''

  s.license = "MIT"

  s.authors = ["Kyle Rippey"]
  s.email = "kylerippey@gmail.com"
  s.homepage = "http://github.com/kylerippey/bare_metal"

  s.files = Dir["lib/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir.glob('test/*_test.rb')

  s.add_runtime_dependency 'net-ssh'
  s.add_runtime_dependency 'net-scp'
end

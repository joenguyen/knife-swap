# rubocop:disable all
require File.expand_path('../lib/knife-swap/version', __FILE__)

Gem::Specification.new do |spec|
  spec.authors       = ['joenguyen']
  spec.email         = ['whyviet@gmail.com']
  spec.description   = %q{Manages multiple knife.rb configurations for Chef}
  spec.summary       = %q{Manages multiple knife.rb configurations for Chef}
  spec.homepage      = 'https://github.com/joenguyen/knife-swap'
  spec.license       = 'Apache-2.0'

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.name          = 'knife-swap'
  spec.version       = Knife::Swap::VERSION
  spec.require_paths = ['lib']

  spec.add_dependency 'chef', '>= 0.12.0'
  spec.add_development_dependency 'rake', '>= 10.0'
  spec.add_development_dependency 'coveralls', '>= 0.7.9'
  spec.add_development_dependency 'yard', '>= 0.8'
  spec.add_development_dependency 'rubocop', '>= 0.37.2'
  spec.add_development_dependency 'rspec', '>= 3.0'
end

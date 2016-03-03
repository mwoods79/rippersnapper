# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rippersnapper/version'

Gem::Specification.new do |spec|
  spec.name          = "rippersnapper"
  spec.version       = Rippersnapper::VERSION
  spec.authors       = ["Micah Woods"]
  spec.email         = ["micahwoods@gmail.com"]
  spec.description   = %q{Rip and snap domains using Rippersnappers jaws of steele!}
  spec.summary       = %q{Named after the worst decepticon ever, a shark with T-Rex arms...}
  spec.homepage      = %q{https://github.com/mwoods79/rippersnapper}
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.3"
end

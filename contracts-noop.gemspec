# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'contracts/noop/version'

Gem::Specification.new do |spec|
  spec.name          = "contracts-noop"
  spec.version       = Contracts::Noop::VERSION
  spec.authors       = ["Oleksii Fedorov"]
  spec.email         = ["waterlink000@gmail.com"]
  spec.summary       = %q{Allows usage of contracts.ruby as a development dependency}
  spec.description   = %q{
Allows usage of [contracts.ruby](https://github.com/egonSchiele/contracts.ruby) in gems/libraries only as a development dependency.

This gem needs to be a runtime dependency though.

When it is impossible to load `contracts`, this gem will load its own `Contracts` which will be noop.
}
  spec.homepage      = "https://github.com/waterlink/contracts-noop"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

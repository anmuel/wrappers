# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wrappers/version'

Gem::Specification.new do |spec|
  spec.name          = "wrappers"
  spec.version       = Wrappers::VERSION
  spec.authors       = ["Andreas Müller"]
  spec.email         = ["anmuel86@gmail.com"]

  spec.summary       = %q{Summary of Wrapper classes for easy access to common datatypes}
  spec.description   = %q{A collection of classes that make handling wrapped data easier.}
  spec.homepage      = "http://github.com/anmuel/wrappers"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport'
  spec.add_dependency 'netaddr'
  spec.add_dependency 'activemodel'
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'simplecov'
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'memoized_inflectors_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "memoized_inflectors_rails"
  spec.version       = MemoizedInflectorsRails::VERSION
  spec.authors       = ["WizardOfOgz"]
  spec.email         = ["andyogzewalla@gmail.com"]

  spec.summary       = "A Rails wrapper for the memoized_inflectors gem."
  spec.homepage      = "https://github.com/WizardOfOgz/memoized_inflectors_rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "memoized_inflectors",     "1.0.0-beta.2"

  spec.add_development_dependency "rspec",       "~> 3.0"
  spec.add_development_dependency "rails",       "~> 5.0"
  spec.add_development_dependency "combustion",  "~> 0.5.5"
end

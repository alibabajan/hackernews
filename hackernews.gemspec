# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hackernews/version'

Gem::Specification.new do |spec|
  spec.name          = "hackernews"
  spec.version       = Hackernews::VERSION
  spec.authors       = ["alireza"]
  spec.email         = ["ithoughtful@gmail.com"]
  spec.summary       = %q{Ruby wrapper for the Hacker News API}
  spec.description   = %q{Ruby wrapper for the Hacker News API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "httparty"
end

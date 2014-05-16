# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zip5/version'

Gem::Specification.new do |spec|
  spec.name          = "zip5"
  spec.version       = Zip5::VERSION
  spec.authors       = ["Seamus Abshere"]
  spec.email         = ["seamus@abshere.net"]
  spec.summary       = %q{Convert United States zip codes to their correct Zip5 representation, even if they're missing a leading zero and/or they have the +4 suffix.}
  spec.description   = %q{For example, 8840 means 08840 and 5011234 means 00501-1234.}
  spec.homepage      = "https://github.com/seamusabshere/zip5"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end

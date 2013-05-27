# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exifparser/version'

Gem::Specification.new do |spec|
  spec.name          = "exifparser"
  spec.version       = ExifParser::VERSION
  spec.authors       = ["kp", "n-kashi"]
  spec.email         = ["knomura.1394@gmail.com", "kashijuku@gmail.com"]
  spec.description   = %q{Exif tag parser written in pure Ruby}
  spec.summary       = %q{Exif tag parser written in pure Ruby}
  spec.homepage      = ""
  spec.license       = "Ruby"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

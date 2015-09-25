# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'appbundle_updater/version'

Gem::Specification.new do |spec|
  spec.name          = "appbundle-updater"
  spec.version       = AppbundleUpdater::VERSION
  spec.authors       = ["lamont-granquist"]
  spec.email         = ["lamont@chef.io"]
  spec.description   = %q{Updates appbundled apps in Chef's omnibus packages}
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "Apache2"
  spec.homepage      = "https://github.com/chef/appbundle-updater"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end

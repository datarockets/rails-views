# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails/views/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails-views'
  spec.version       = Rails::Views::VERSION
  spec.authors       = ['Roman Dubrovsky']
  spec.email         = ['hello@datarockets.com']

  spec.summary       = 'Real view objects for Rails'
  spec.description   = 'Real view objects for Rails'
  spec.homepage      = 'https://github.com/datarockets/rails-views'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'cells'
  spec.add_dependency 'cells-rails'
  spec.add_dependency 'cells-slim'
end

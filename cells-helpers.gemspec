# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cells_helpers/version'

Gem::Specification.new do |spec|
  spec.name          = 'cells-helpers'
  spec.version       = CellsHelpers::VERSION
  spec.authors       = ['Roman Dubrovsky']
  spec.email         = ['roma2107946@gmail.com']

  spec.summary       = 'Datarockets cells helpers'
  spec.description   = 'Helpers for easy working and clear code'
  spec.homepage      = 'https://github.com/roman-dubrovsky/cells_helpers'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "'http://mygemserver.com'"
  # else
  #   raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
end

# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'thorin/version'

Gem::Specification.new do |spec|
  spec.name          = 'thorin'
  spec.version       = Thorin::VERSION
  spec.authors       = ['rameshrvr']
  spec.email         = ['rameshrvr@outlook.com']

  spec.summary       = 'will update in future'
  spec.description   = 'validate yaml with ease'
  spec.homepage      = 'https://github.com/rameshrvr/thorin'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set
  # the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow
  # pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  # spec.bindir        = 'exe'
  spec.executables   = ['thorin']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'colorize'
end

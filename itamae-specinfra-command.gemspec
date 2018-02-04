# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itamae/specinfra/command/version'

Gem::Specification.new do |spec|
  spec.name          = 'itamae-specinfra-command'
  spec.version       = Itamae::Specinfra::Command::VERSION
  spec.authors       = ['ntrv']
  spec.email         = ['hydrangea56@me.com']
  spec.summary       = 'Wrapper for using Specinfra Command in Itamae'
  spec.description   = 'Wrapper for using Specinfra Command in Itamae'
  spec.homepage      = 'https://github.com/ntrv/itamae-specinfra-command'
  spec.license       = 'Apache'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_dependency 'itamae'
  spec.add_dependency 'specinfra'
end

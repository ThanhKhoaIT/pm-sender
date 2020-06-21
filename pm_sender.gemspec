# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/pm_sender/version'

Gem::Specification.new do |spec|
  spec.name          = 'pm_sender'
  spec.version       = PmSender::VERSION
  spec.authors       = ['Khoa Nguyen']
  spec.email         = ['thanhkhoait@gmail.com']

  spec.summary       = 'Phone message sender'
  spec.description   = 'The Rails gem for Phone message sender'
  spec.homepage      = 'https://github.com/ThanhKhoaIT/pm-sender'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.0.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end

# coding: utf-8
lib = ::File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubocop/super_awesome_print_rubocop/version'

::Gem::Specification.new do |spec|
  spec.name          = 'super_awesome_print_rubocop'
  spec.version       = ::SuperAwesomePrintRubocop::VERSION
  spec.authors       = ['Oleg Antonyan']
  spec.email         = ['oleg.b.antonyan@gmail.com']

  spec.summary       = 'Ensure you do not have `sap` in production from SuperAwesomePrint gem'
  spec.description   = 'Ensure you do not have `sap` in production from SuperAwesomePrint gem'
  spec.homepage      = 'http://github.com/olegantonyan/super_awesome_print_rubocop'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| ::File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_dependency 'rubocop'
end

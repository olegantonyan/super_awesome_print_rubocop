require_relative 'lib/rubocop/super_awesome_print_rubocop/version'

Gem::Specification.new do |spec|
  spec.name          = 'super_awesome_print_rubocop'
  spec.version       = SuperAwesomePrintRubocop::VERSION
  spec.authors       = ['Oleg Antonyan']
  spec.email         = ['oleg.b.antonyan@gmail.com']

  spec.summary       = 'RuboCop cop that keeps super_awesome_print debug calls out of your code'
  spec.description   = 'Flags leftover `sap` and `sapf` calls from the super_awesome_print gem.'
  spec.homepage      = 'https://github.com/olegantonyan/super_awesome_print_rubocop'
  spec.license       = 'MIT'
  spec.metadata['default_lint_roller_plugin'] = 'SuperAwesomePrintRubocop::Plugin'

  spec.required_ruby_version = '>= 2.7'

  spec.files         = Dir['lib/**/*.rb', 'config/*.yml'] + %w[README.md LICENSE.txt]
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lint_roller', '~> 1.1'
  spec.add_runtime_dependency 'rubocop', '>= 1.0'

  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rake'
end

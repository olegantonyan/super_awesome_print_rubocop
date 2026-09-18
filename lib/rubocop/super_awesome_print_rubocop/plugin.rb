require 'lint_roller'

module SuperAwesomePrintRubocop
  class Plugin < LintRoller::Plugin
    def about
      LintRoller::About.new(
        name: 'super_awesome_print_rubocop',
        version: VERSION,
        homepage: 'https://github.com/olegantonyan/super_awesome_print_rubocop',
        description: 'Flags leftover super_awesome_print debug calls (`sap`, `sapf`).'
      )
    end

    def supported?(context)
      context.engine == :rubocop
    end

    def rules(_context)
      LintRoller::Rules.new(
        type: :path,
        config_format: :rubocop,
        value: File.expand_path('../../../config/default.yml', __dir__)
      )
    end
  end
end

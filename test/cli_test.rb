require 'test_helper'
require 'json'
require 'open3'
require 'tmpdir'

class CliTest < Minitest::Test
  LIB = File.expand_path('../lib', __dir__)

  def test_require
    assert_equal [[1, 'Avoid `sap` in production.']], rubocop("require:\n  - super_awesome_print_rubocop\n")
  end

  def test_plugins
    skip 'plugins need RuboCop 1.72+' if Gem::Version.new(RuboCop::Version::STRING) < Gem::Version.new('1.72')

    assert_equal [[1, 'Avoid `sap` in production.']], rubocop("plugins:\n  - super_awesome_print_rubocop\n")
  end

  private

  def rubocop(config)
    Dir.mktmpdir do |dir|
      File.write(File.join(dir, '.rubocop.yml'), config)
      File.write(File.join(dir, 'code.rb'), "sap 1\nFoo.sap 2\n")
      args = %w[--format json --only SuperAwesomePrint/Avoid --cache false code.rb]
      out, err, = Open3.capture3(RbConfig.ruby, '-I', LIB, Gem.bin_path('rubocop', 'rubocop'), *args, chdir: dir)
      offenses = JSON.parse(out).fetch('files').flat_map { |file| file['offenses'] }
      offenses.map { |offense| [offense.dig('location', 'line'), offense['message']] }
    rescue JSON::ParserError
      flunk "rubocop failed:\n#{out}#{err}"
    end
  end
end

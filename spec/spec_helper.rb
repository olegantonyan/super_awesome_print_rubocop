require 'bundler/setup'
require 'super_awesome_print_rubocop'
require 'rubocop/rspec/support'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  if ENV.key? 'CI'
    config.before(:example, :focus) { raise 'Should not commit focused specs' }
  else
    config.filter_run focus: true
    config.run_all_when_everything_filtered = true
    config.fail_fast = ENV.key? 'RSPEC_FAIL_FAST'
  end

  config.disable_monkey_patching!

  config.order = :random

  Kernel.srand config.seed
end

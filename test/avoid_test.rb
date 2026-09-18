require 'test_helper'

class AvoidTest < Minitest::Test
  def test_sap
    assert_equal [['Avoid `sap` in production.', 'sap "hello world"']], offenses('sap "hello world"')
  end

  def test_sapf
    assert_equal [['Avoid `sapf` in production.', 'sapf "hello world"']], offenses('sapf "hello world"')
  end

  def test_self_receiver
    assert_equal [['Avoid `sap` in production.', 'self.sap(x)']], offenses('self.sap(x)')
  end

  def test_nested_call
    assert_equal [['Avoid `sap` in production.', 'sap(x)']], offenses('y = sap(x)')
  end

  def test_multiple_calls
    assert_equal 2, offenses("sap 1\nsapf 2\n").size
  end

  def test_other_receiver
    assert_empty offenses('Something.sap(x)')
  end

  def test_similar_names
    assert_empty offenses("asap(1)\nsap_it(1)\n")
  end

  def test_local_variable
    assert_empty offenses("sap = 1\nsap\n")
  end

  private

  def offenses(source)
    processed_source = RuboCop::ProcessedSource.new(source.dup, 2.7)
    cop = RuboCop::Cop::SuperAwesomePrint::Avoid.new(RuboCop::Config.new('AllCops' => { 'DisplayCopNames' => false }))
    report = RuboCop::Cop::Commissioner.new([cop], [], raise_error: true).investigate(processed_source)
    report.offenses.map { |offense| [offense.message, offense.location.source] }
  end
end

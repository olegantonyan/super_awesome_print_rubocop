require 'spec_helper'

RSpec.describe RuboCop::Cop::SuperAwesomePrint::Avoid do
  subject(:cop) { described_class.new }

  it 'registers an offense for sap method' do
    inspect_source(cop, 'sap "hello world"')
    expect(cop.offenses.size).to eq(1)
    expect(cop.messages)
      .to eq(['Avoid `sap` in production'])
    expect(cop.highlights).to eq(['sap "hello world"'])
  end

  it 'does not register an offense for having sap as a method/substring' do
    inspect_source(cop, 'Something.sap')
    expect(cop.offenses.size).to eq(0)
  end
end

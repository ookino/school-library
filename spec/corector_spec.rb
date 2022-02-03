require_relative '../corrector'

describe Corrector do
  it 'should correct name' do
    correct = Corrector.new
    name = 'corrections'
    expect(correct.correct_name(name)).to eq 'Correction'
  end
end
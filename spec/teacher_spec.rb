require_relative '../teacher'

describe Teacher do
  context 'when testing the teacher class' do
    before(:each) do
      @teacher = Teacher.new('Fred', 28, 'Spelling')
    end

    it 'should return the correct teachers name' do
      expect(@teacher.name).to eq 'Fred'
    end

    it 'should return the correct student age' do
      expect(@teacher.age).to eql(28)
    end
  end
end

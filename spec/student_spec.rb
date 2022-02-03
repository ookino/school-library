require_relative '../student'
describe Student do
  context 'when testing the student class' do
    before(:each) do
      @classroom = Classroom.new('Literature')
      @student = Student.new('Stephanie', 18, 'Y')
    end

    it 'should return the correct student name' do
      expect(@student.name).to eq 'Stephanie'
    end

    it 'should return a numeric value' do
      expect(@student.age).to be_kind_of Numeric
    end
  end
end

require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'when testing the student class' do
    before(:each) do
      @classroom = Classroom.new('Literature')
      @student = Student.new('Ariel', 33, @classroom)
    end

    it 'can has an instance' do
      expect(@classroom).to be_an_instance_of Classroom
    end

    it 'classroom label should match' do
      expect(@classroom.label).to eq('Literature')
    end

    it 'has 1 student' do
      @classroom.add_student(@student)

      expect(@classroom.students.size).to be 1
    end
  end
end

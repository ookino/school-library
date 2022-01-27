require './person'
class Student < Person
  def initialize(_clasroom, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  attr_accessor :owner

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classrom = classroom
    classroom.student.push(self) unless classroom.students.include?(self)
  end
end

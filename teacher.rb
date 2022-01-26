require './person'
class Teacher < Person
  def initialize(_specialization, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_service
    true
  end
end

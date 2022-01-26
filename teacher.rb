require './person'
class Teacher < Person
  def initialize(_specialization)
    super(id, age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_service
    true
  end
end

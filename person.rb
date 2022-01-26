class Person
  def initialize(_id, age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  attr_reader :id
  attr_accessor :name, :age

  def can_use_service
    of_age || parent_permission == true
  end

  private

  def of_age
    @age >= 18
  end
end

require './corrector'
require './rental'
class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rental = []
  end

  def can_use_service
    of_age || parent_permission == true
  end

  def validate_name
    @name = @corrector.correct_name(name)
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  private

  def of_age
    @age >= 18
  end
end

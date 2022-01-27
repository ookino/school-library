class Rental
  def initialize(_date, _book, _person)
    @date = date
    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end
  attr_accessor :date, :book, :person
end

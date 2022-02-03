require_relative '../rental.rb'
require_relative '../person.rb'
require_relative '../book.rb'

describe Rental do
  before (:each) do
    @new_person =  Person.new('paul', 25)
    @new_book = Book.new('The daughter', 'Jasmine Cresswell')
    @rental = Rental.new '02/02/2020', @new_person, @new_book
  end

    it 'has 1 person' do
      expect(@rental.person.name).to eql('paul')
    end

    it 'it has a book' do
      expect(@rental.book.title).to eql('The daughter')
    end

end
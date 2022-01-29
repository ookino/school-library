# rubocop:disable Metrics
require './book'
require './classroom'
require './rental'
require './person'
require './student'
require './teacher'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    @class = Classroom.new('class7')
  end

  def start
    puts 'Welcome tp School Library App'
    menu
  end

  def menu
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    user_option = gets.chomp
    get_user_option(user_option)
  end

  def get_user_option(option)
    case option
    when '1'
      all_books
    when '2'
      all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      rentals_by_id
    when '7'
      abort('Thank you for using our Library!')
    else
      puts 'Please enter a number between 1 and 7'
      puts
      menu
    end
  end

  def all_books
    puts 'There are no books! Add a new book.' if @books.empty?
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    sleep 1
    puts
    menu
  end

  def all_people
    puts 'The are no people! Please add a student or teacher.' if @people.empty?
    @people.map { |person| puts "[#{person.class}] Name: #{person.name}, Id: #{person.id}, Age: #{person.age}, " }
    sleep 1
    puts
    menu
  end

  def create_person
    print 'Do you want to create a student(1) or a teacher(2)? [Input the number]:'
    input = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    case input
    when 1
      create_student(age, name)
    when 2
      create_teacher(age, name)
    end
    puts 'Person created successfully!'
    menu
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book added successfully'
    sleep 1
    puts
    menu
  end

  def create_student(age, name)
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase == 'Y'
    @people << Student.new(name, age, parent_permission)
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(name, age, specialization)
  end

  def create_rental
    puts 'Select a book from the folowing list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts book_index
    puts 'Select a person from the folowing list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts person_index
    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @people[person_index], @books[book_index])
    puts 'Rental created successfully'
    sleep 1
    puts
    menu
  end

  def rentals_by_id
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
    sleep 1
    puts
    menu
  end
end

def main
  app = App.new
  app.start
end
# rubocop:enable Metrics
main

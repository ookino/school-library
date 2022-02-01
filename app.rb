require './book'
require './classroom'
require './rental'
require './person'
require './student'
require './teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def all_books
    puts 'There are no books! Add a new book.' if @books.empty?
    @books.each_with_index { |book, index| puts "#{index} => Title: #{book.title}, Author: #{book.author}" }
  end

  def all_people
    puts 'The are no people! Please add a student or teacher.' if @people.empty?
    @people.each_with_index do |person, index|
      puts "#{index} => [#{person.class}] Name: #{person.name}, Id: #{person.id}, Age: #{person.age}, "
    end
  end

  def create_person_input
    option = user_input('Do you want to create a student (1), or a teacher (2)? : ')
    if [1, 2].include? option
      age = user_input('Age: ')
      name = user_input('Name: ', 'string')
      create_person(option, age, name)
    else
      puts 'Invalid option'
      create_person_input
    end
  end

  def create_student_input(age, name)
    print
    permission = user_input('Has parent permission? [Y/N]: ', 'upcase')
    create_student(age, name, permission)
  end

  def create_teacher_input(age, name)
    print 'Specialty: '
    specialty = gets.chomp
    create_teacher(age, name, specialty)
  end

  def create_book_input
    title = user_input('Title: ', 'string')
    author = user_input('Author: ', 'string')
    create_book(title, author)
  end

  def create_rental_input
    puts 'Select a book from the folowing list by number'
    all_books
    book_index = gets.chomp.to_i
    puts
    puts 'Select a person from the folowing list by number (not id)'
    all_people
    person_index = gets.chomp.to_i
    puts
    date = user_input('Date: ')
    puts
    create_rental(book_index, person_index, date)
  end

  def rentals_by_id
    id = user_input('Person ID: ')
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
    puts
  end

  private

  def user_input(label = '', type = 'int')
    puts
    print label
    case type
    when 'string'
      gets.chomp
    when 'upcase'
      gets.chomp.upcase
    else
      gets.chomp.to_i
    end
  end

  def create_person(option, age, name)
    case option
    when 1
      create_student_input(age, name)
    else
      create_teacher_input(age, name)
    end
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts
    puts 'Book added successfully'
    puts
  end

  def create_rental(book_index, person_index, date)
    @rentals << Rental.new(date, @people[person_index], @books[book_index])
    puts
    puts 'Rental created successfully'
    puts
  end

  def create_student(age, name, parent_permission)
    @people << Student.new(name, age, parent_permission)
    puts
    puts 'Student created successfully'
    puts
  end

  def create_teacher(age, name, specialization)
    @people << Teacher.new(name, age, specialization)
    puts
    puts 'Teacher created successfully'
    puts
  end
end

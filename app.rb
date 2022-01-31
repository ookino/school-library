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
    @class = Classroom.new('class 8')
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
    else
      puts 'Wrong option'
      puts '--------------------------------------'
      puts 'Please enter a number between 1 and 7'
    end
  end

  def all_books
    puts 'There are no books! Add a new book.' if @books.empty?
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    sleep 1
    puts
  end

  def all_people
    puts 'The are no people! Please add a student or teacher.' if @people.empty?
    @people.map { |person| puts "[#{person.class}] Name: #{person.name}, Id: #{person.id}, Age: #{person.age}, " }
    sleep 1
    puts
  end

  def create_person
    input = user_input('Do you want to create a student(1) or a teacher(2)? [Input the number]: ', 'int')
    age = user_input('Age: ', 'int')
    name = user_input('Name: ', 'str')
    case input
    when 1
      create_student(age, name)
    when 2
      create_teacher(age, name)
    end
    puts 'Person created successfully!'
  end

  def create_student(age, name)
    parent_permission = user_input('Has parent permission? [Y/N]: ', 'str')
    parent_permission.upcase
    @people << Student.new(name, age, parent_permission)
  end

  def create_teacher(age, name)
    specialization = user_input('Specialization: ', 'str')
    @people << Teacher.new(name, age, specialization)
  end

  def create_book
    title = user_input('Title: ', 'str')
    author = user_input('Author: ', 'str')
    book = Book.new(title, author)
    @books << book

    puts 'Book added successfully'
    sleep 1
    puts
  end

  def create_rental
    puts 'Select a book from the folowing list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    book_index = user_input('', 'int')
    puts book_index
    puts 'Select a person from the folowing list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = user_input('', 'int')
    puts person_index
    date = user_input('Date: ', 'str')
    @rentals << Rental.new(date, @people[person_index], @books[book_index])
    puts 'Rental created successfully'
    sleep 1
    puts
  end

  def rentals_by_id
    # print 'ID of person: '
    # id = gets.chomp.to_i
    id = user_input('ID of person: ', 'int')
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
    sleep 1
    puts
  end

  def user_input(label = '', type = 'int')
    print label
    @input = if type == 'int'
               gets.chomp.to_i
             else
               gets.chomp
             end
  end
end

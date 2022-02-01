require './app'

class Main
  def initialize
    @app = App.new
    @options = {
      1 => 'List books',
      2 => 'List people',
      3 => 'Create person',
      4 => 'Create book',
      5 => 'Create rental',
      6 => 'List rentals for a given person id',
      7 => 'Exit'
    }.freeze
    puts 'Welcome tp School Library App'
    puts
  end

  def display_options
    puts 'Please choose an option by entering a number'
    @options.each do |key, value|
      puts "#{key} - #{value}"
    end
  end

  def choose_option(option)
    case option
    when 1
      @app.all_books
    when 2
      @app.all_people
    when 3
      @app.create_person_input
    when 4
      @app.create_book_input
    when 5
      @app.create_rental_input
    when 6
      @app.rentals_by_id
    else
      puts 'Invalid option, Input a valid option'
      puts
      main
    end
    main
  end

  def main
    display_options
    option = gets.chomp.to_i
    if option == 7
      puts '....exiting'
      sleep 0.1
      abort('Thank you for using the Library School App!')
    end
    choose_option(option)
  end
end

Main.new.main

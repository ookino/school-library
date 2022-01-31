require './app'

@options = {
  1 => 'List books',
  2 => 'List people',
  3 => 'Create person',
  4 => 'Create book',
  5 => 'Create rental',
  6 => 'List rentals for a given person id',
  7 => 'Exit'
}.freeze

def main
  puts 'Welcome tp School Library App'
  @app = App.new
  menu
end

def menu
  puts 'Please choose an option by entering a number'
  @options.each do |key, value|
    puts "#{key} - #{value}"
  end
  user_option = gets.chomp

  if user_option == '7'
    abort('Thank you for using our Library!')
  else
    @app.get_user_option(user_option)
    puts
    menu
  end
end
main

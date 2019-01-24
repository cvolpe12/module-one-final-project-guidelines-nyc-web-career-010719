def welcome
  puts "Welcome to [app name]! [Slogan/tag-line]"
end

def user_instance
  puts "What is your name?"
  user_name = gets.chomp
  puts "What is your age"
  age = gets.chomp
  user = User.create(name: user_name, age: age)
end

def menu
  puts "What would you like to do?
        1. Search
        2. Watchlist
        3. Quit"
  menu_selection = gets.chomp
  if menu_selection == "1"
    search_menu
  elsif menu_selection == "2"
    user_watchlist
  elsif menu_selection == "3"
    thank_you
  else
    puts "Invalid Input. Please choose again"
    menu
  end
end



#gets user's watchlist
def user_watchlist
  watchlist = Watchlist.movies # We will write method (or something similar) in class file
  puts watchlist #will create numbered list format format here or in class method
  anything_else
end

def search_menu
  puts "What do you want to search for?
        1. Movie
        2. Tv Show
        3. Actor/Director/Writer/etc.
        4. Quit"

  menu_selection = gets.chomp

  if menu_selection == "1"
    movie_search
  elsif menu_selection == "2"
    tv_search
  elsif menu_selection == "3"
    person_search
  elsif menu_selection == "4"
    thank_you
  else
    puts "Invalid Input. Please choose again"
    search_menu
  end
end

def movie_search
  puts "Enter the name of the movie you'd like to find: "
  name = gets.chomp
  movie_info = Movie.find_by_name(name)
  puts movie_info
  # add_to_watchlist?
  anything_else
end

def tv_search
  puts "Enter the name of the show you'd like to find: "
  name = gets.chomp
  result = TV.find_by_name(name) # We will write method (or something similar) in class file
  puts result "\n \n"
  anything_else
end

def person_search
  puts "Enter the name of the person you'd like to find: "
  name = gets.chomp
  result = Person.find_by_name(name) # We will write method (or something similar) in class file
  puts result "\n \n"
  anything_else
end

# def add_to_watchlist?
#   puts "Would you like to add to your watchlist? (y/n)"
#   user_input = gets.chomp
#   if user_input == 'y'
#      Watchlist.create(user_id: self, movie_id: , movie_title:)
#   elsif user_input == 'n'
#     thank_you
#   end
# end

def anything_else
  puts "Would you like to do anything else? (y/n)"

  user_input = gets.chomp

  if user_input == 'y'
     menu
  elsif user_input == 'n'
    thank_you
  else
    puts "Invalid Input. Please choose again"
    anything_else
  end
end


def thank_you
  puts "Thank you!"
end

def goodbye
  puts "See you later!"
end

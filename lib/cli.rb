def welcome
  puts "Welcome to [app name]! [Slogan/tag-line]"
end


def menu
  puts "What would you like to do?
        1. search
        2. watchlist"
  menu_selection = gets.chomp

  if menu_selection == 1
    search_menu
  elseif menu_selection == 2
    user_watchlist
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
        1. movie
        2. tv show
        3. actor/director/writer/etc."

  menu_selection = gets.chomp

  if menu_selection == 1
    movie_search
  elsif menu_selection == 2
    tv_search
  elsif menu_selection == 3
    person_search
  end
end

def movie_search
  puts "Enter the name of the movie you'd like to find: "
  name = gets.chomp
  result = Movie.find_by_name(name) # We will write method (or something similar) in class file
  puts result "\n \n"
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


def anything_else
  puts "Would you like to do anything else? (y/n)"

  user_input = gets.chomp

  if user_input == 'y'
     menu
  elsif user_input == 'n'
    goodbye
  end
end


def goodbye
  puts "See you later!"
end

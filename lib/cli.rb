class Cli
  def self.welcome
    puts "Welcome to [app name]! [Slogan/tag-line]"
  end

  def self.user_instance
    puts "What is your name?"
    user_name = gets.chomp
    puts "What is your age"
    age = gets.chomp
    @user = User.create(name: user_name, age: age)
  end

  def self.menu
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

  def self.search_menu
    puts "What do you want to search for?
          1. Movie
          2. TV Show
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

  #gets user's watchlist
  def self.user_watchlist
    puts "What do you want to do with your watchlist?
          1. View
          2. Add Movie
          3. Search
          4. Quit"
    menu_selection = gets.chomp
    if menu_selection == "1"
      user_movies
    elsif menu_selection == "2"
      # user_watchlist
    elsif menu_selection == "3"
      # thank_you
    elsif menu_selection == "4"
      thank_you
    else
      puts "Invalid Input. Please choose again"
      user_watchlist
    end
    # watchlist = Watchlist.movies # We will write method (or something similar) in class file
    # puts watchlist #will create numbered list format format here or in class method
    anything_else
  end

  def self.movie_search
    puts "Enter the name of the movie you'd like to find: "
    name = gets.chomp
    # Movie.exist?(name)
    movie_info = Movie.find_by_name(name)
    puts movie_info["title"]
    puts movie_info["release_date"]
    puts movie_info["vote_average"]
    puts movie_info["overview"][0..100] << "..."
    @movie = Movie.create(title: movie_info["title"], year_released: movie_info["release_date"], vote_average: movie_info["vote_average"], brief_description: movie_info["overview"][0..100] << "...")
    add_to_watchlist?
    anything_else
  end

  def self.tv_search
    puts "Enter the name of the show you'd like to find: "
    name = gets.chomp
    result = TV.find_by_name(name) # We will write method (or something similar) in class file
    puts result "\n \n"
    anything_else
  end

  def self.person_search
    puts "Enter the name of the person you'd like to find: "
    name = gets.chomp
    result = Person.find_by_name(name) # We will write method (or something similar) in class file
    puts result "\n \n"
    anything_else
  end

  def self.add_to_watchlist?
    puts "Would you like to add to your watchlist? (y/n)"
    user_input = gets.chomp
    if user_input == 'y'
       Watchlist.create(user_id: @user.id, movie_id: @movie.id, movie_title: @movie.title)
    elsif user_input == 'n'
      puts "Okay."
    end
  end

  def self.anything_else
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

  def self.user_movies
    @user=User.find(@user.id)
    if @user.watchlists == []
      puts "You don't have any movies in your watchlist."
    else
      puts "Your Watchlist:"
      movie = @user.watchlists.map do |wl|
        wl.movie_title
      end
      puts movie
    end
  end

  def self.thank_you
    puts "Thank you!"
  end

  def self.goodbye
    puts "See you later!"
  end
end #end of class

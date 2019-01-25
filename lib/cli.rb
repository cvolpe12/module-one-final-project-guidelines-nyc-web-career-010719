class Cli
  def self.welcome
    puts "Welcome to Watch It! Recommendations from yourself, for yourself."
  end


  def self.invalid_selection
    puts "The input you gave is invalid. Please enter a number."
  end

  def self.invalid_y_or_n
    puts "The input you gave is invalid. Please enter 'y' for yes or 'n' for no."
  end

  def self.quit
    puts "Thank you!"
  end

  def self.confirm(entry)
    puts "You entered #{entry}. Is this correct? (y/n)"
    is_correct_name = gets.chomp
    if is_correct_name == "n"
      set_username
    elsif is_correct_name == "y"
    else
      invalid_y_or_n
      confirm(entry)
    end
  end

  def self.goodbye
    puts "See you later!"
  end

  def self.set_username
    puts "What would you like your user name to be?"
    user_name = gets.chomp
    confirm(user_name)
    user_name
  end

  def self.set_password
    puts "Please set a password that you will remember: "
    password = gets.chomp
    confirm(password)
    password
  end

  def self.set_age
    puts "How old are you?"
    age = gets.chomp.to_i
    confirm(age)
    age
  end

  def self.register
    user_name = self.set_username
    password = self.set_password
    age = self.set_age
    @current_user = User.create(user_name: user_name, password: password, age: age)
  end

  def self.user_selection
    puts "Would you like to:
          1. Login
          2. Register
          3. Quit"
    input = gets.chomp
    if input == "1"
      puts "User name: "
      user_name = gets.chomp
      puts "password: "
      password = gets.chomp
      @current_user = User.authenticate(user_name, password)
      # binding.pry
    elsif input == "2"
      register
    else
      quit
    end
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
      quit
    else
      invalid_selection
      menu
    end
  end

  #gets user's watchlist
  def self.user_watchlist
    puts "What do you want to do with your watchlist?
          1. View
          2. Add Movie/TV Show
          3. Quit"
    menu_selection = gets.chomp
    if menu_selection == "1"
      user_movies
    elsif menu_selection == "2"
      search_menu
    # elsif menu_selection == "3"
    #  # search
    elsif menu_selection == "3"
     quit
    else
      invalid_selection
      user_watchlist
    end
    anything_else
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
      quit
    else
      invalid_selection
      search_menu
    end
  end

  def self.movie_search
    puts "Enter the name of the movie you'd like to find: "
    name = gets.chomp
    movie_info = Movie.find_by_name(name)
    puts movie_info["title"]
    puts movie_info["release_date"]
    puts movie_info["vote_average"]
    puts movie_info["overview"][0..100] << "..."
    @movie = Movie.create(title: movie_info["title"], year_released: movie_info["release_date"], vote_average: movie_info["vote_average"], brief_description: movie_info["overview"][0..100] << "...")
    add_to_movie_watchlist?
    anything_else
  end

  def self.tv_search
    puts "Enter the name of the show you'd like to find: "
    name = gets.chomp
    tv_info = TvShow.find_by_name(name) # We will write method (or something similar) in class file
    puts tv_info["name"]
    puts tv_info["first_air_date"]
    puts tv_info["vote_average"]
    puts tv_info["overview"][0..100] << "..."
    @tv = TvShow.create(title: tv_info["name"], year_released: tv_info["first_air_date"], vote_average: tv_info["vote_average"], brief_description: tv_info["overview"][0..100] << "...")
    binding.pry
    add_to_tv_watchlist?
    anything_else
  end

  def self.person_search
    puts "Enter the name of the person you'd like to find: "
    name = gets.chomp
    result = Person.find_by_name(name) # We will write method (or something similar) in class file
    puts result
    anything_else
  end

  def self.user_movies
    # binding.pry
     @current_user = User.find(@current_user.id)
     if @current_user.watchlists == []
       puts "You don't have any movies in your watchlist."
     else
       puts "Your Watchlist:"
       ent = []
       movie = @current_user.watchlists.map do |wl|
         # binding.pry
         if wl.movie_title != nil
           ent << wl.movie_title
        elsif wl.tv_show_title != nil
          ent << wl.tv_show_title
        end
       end
       watchlist_titles(ent)
     end
   end

   def self.watchlist_titles(array)
     array.each {|arr| puts arr}
   end

  def self.add_to_movie_watchlist?
    puts "Would you like to add to your watchlist? (y/n)"
    user_input = gets.chomp
    if user_input == 'y'
       Watchlist.create(user_id: @current_user.id, movie_id: @movie.id, movie_title: @movie.title, tv_id: nil, tv_show_title: nil)
    elsif user_input == 'n'
      puts "Okay."
    end
  end

  def self.add_to_tv_watchlist?
    puts "Would you like to add to your watchlist? (y/n)"
    user_input = gets.chomp
    if user_input == 'y'
       Watchlist.create(user_id: @current_user.id, movie_id: nil, movie_title: nil, tv_id: @tv.id, tv_show_title: @tv.title)
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
      quit
    else
      invalid_y_or_n
      anything_else
    end
  end

end #end of class

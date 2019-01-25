class Watchlist < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
  belongs_to :tv_show

  def self.user_watchlist(user, movie_id=nil, movie_title=nil, tv_id=nil, tv_show_title=nil)
    puts "Would you like to add to your watchlist? (y/n)"
    user_input = gets.chomp
    if user_input == 'y'
       Watchlist.create(user_id: user, movie_id: movie_id, movie_title: movie_title, tv_id: tv_id, tv_show_title: tv_show_title)
    elsif user_input == 'n'
      puts "Okay."
    end
  end


end

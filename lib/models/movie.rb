class Movie < ActiveRecord::Base
  has_many :watchlists
  has_many :users, through: :watchlists
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def self.find_by_name(name)
    response_string = RestClient.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['API_KEY']}&query=#{name}")
    movie_hash = JSON.parse(response_string)
    found_movie = movie_hash["results"].find do |movie|
      movie["title"].downcase == name.downcase
    end
    found_movie
  end

end

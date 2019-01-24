class Movie < ActiveRecord::Base
  has_many :watchlists
  has_many :users, through: :watchlists
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def self.find_by_name(name)
    response_string = RestClient.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['API_KEY']}&query=#{name}")
    movie_hash = JSON.parse(response_string)
    found_movie = movie_hash["results"].find do |movie|
      movie["title"] == name
    end
    Movie.create(title:found_movie["title"], year_released:found_movie["release_date"], vote_average:found_movie["vote_average"], brief_description:found_movie["overview"][0..100] << "...")
    puts found_movie["title"]
    puts found_movie["release_date"]
    puts found_movie["vote_average"]
    puts found_movie["overview"][0..100] << "..."
  end

  # def get_title(name)
  #   response_string = RestClient.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['API_KEY']}&query=#{name}")
  #   movie_hash = JSON.parse(response_string)
  #   found_movie = movie_hash["results"].find do |movie|
  #     movie["title"] == name
  #   end
  # end

end

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
     t =found_movie["title"]
     rd = found_movie["release_date"]
     va =found_movie["vote_average"]
     o = found_movie["overview"][0..100] << "..."
     puts t
     puts rd
     puts va
     puts o
    Movie.create(title: t, year_released: rd, vote_average: va, brief_description: o)
  end

  # def get_title(name)
  #   response_string = RestClient.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['API_KEY']}&query=#{name}")
  #   movie_hash = JSON.parse(response_string)
  #   found_movie = movie_hash["results"].find do |movie|
  #     movie["title"] == name
  #   end
  # end

end

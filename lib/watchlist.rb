class Watchlist < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  require 'rest-client'
require 'json'
require 'pry'

def find_character(character_name)
  response_string = RestClient.get('')
  response_hash = JSON.parse(response_string)
  character_hash = response_hash["results"].find { |character| character["name"] == character_name }
end

def character_film(films)
  films.map do |film|
    response_film = RestClient.get(film)
    film_hash = JSON.parse(response_film)
  end
end

def get_character_movies_from_api(character_name)
  films = find_character(character_name)["films"]
  character_film(films)
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each { |film| puts film["title"] }
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end


end

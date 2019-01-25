class Person < ActiveRecord::Base
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.find_by_name(person_name)
    response_string = RestClient.get("https://api.themoviedb.org/3/search/person?api_key=#{ENV['API_KEY']}&query=#{person_name}")
    response_hash = JSON.parse(response_string)
    person_hash = response_hash["results"].find do |person|
      person["name"].downcase == person_name.downcase
    end
    # binding.pry
    puts person_hash["name"] <<":"
    puts person_hash["known_for"].map {|movie| movie["title"]}
  end

  def self.films(films)
    films.map do |film|
      response_film = RestClient.get(film)
      film_hash = JSON.parse(response_film)
    end
  end

  def get_movies_from_api(person_name)
    films = find_by_name(person_name)["known_for"]
    films(films)
  end

  def print_movies(films)
    films.each { |film| puts film["title"] }
  end

  def show_person_movies(person)
    films = get_person_movies_from_api(person)
    print_movies(films)
  end

end

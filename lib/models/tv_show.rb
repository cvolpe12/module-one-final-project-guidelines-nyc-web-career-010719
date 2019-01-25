class TvShow < ActiveRecord::Base
  has_many :watchlists
  has_many :users, through: :watchlists
  has_many :actor_tvs
  has_many :actors, through: :actor_tvs

  def self.find_by_name(name)
    response_string = RestClient.get("https://api.themoviedb.org/3/search/tv?api_key=#{ENV['API_KEY']}&query=#{name}")
    tv_hash = JSON.parse(response_string)
    @found_tv = tv_hash["results"].find do |tv|
      tv["name"].downcase == name.downcase
    end
    @found_tv
  end

  def self.tv_info
    puts @found_tv["name"]
    puts @found_tv["first_air_date"]
    puts @found_tv["vote_average"]
    puts @found_tv["overview"][0..100] << "..."
  end

  def self.tv_instance
    TvShow.create(title: @found_tv["name"], year_released: @found_tv["first_air_date"], vote_average: @found_tv["vote_average"], brief_description: @found_tv["overview"][0..100] << "...")
  end

end #end of class

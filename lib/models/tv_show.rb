class TvShow < ActiveRecord::Base
  has_many :watchlists
  has_many :users, through: :watchlists
  has_many :actor_tvs
  has_many :actors, through: :actor_tvs

  def self.find_by_name(name)
    response_string = RestClient.get("https://api.thetvdb.org/3/search/tv?api_key=#{ENV['API_KEY']}&query=#{name}")
    tv_hash = JSON.parse(response_string)
    found_tv = tv_hash["results"].find do |tv|
      tv["title"].downcase == name.downcase
    end
    found_tv
  end

end #end of class

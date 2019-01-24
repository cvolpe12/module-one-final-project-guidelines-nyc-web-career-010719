class TvShow < ActiveRecord::Base
  has_many :watchlists
  has_many :users, through: :watchlists
  has_many :actor_tvs
  has_many :actors, through: :actor_tvs

  def self.find_by_name(name)
    response_string = RestClient.get("https://api.thetvdb.org/3/search/tv?api_key=#{ENV['API_KEY']}&query=#{name}")
    tv_hash = JSON.parse(response_string)
    found_tv = tv_hash["results"].find do |tv|
      tv["title"] == name
    end
    found_tv
    # tv.create(title:found_tv["title"], year_released:found_tv["release_date"], vote_average:found_tv["vote_average"], brief_description:found_tv["overview"][0..100] << "...")
    # puts found_tv["title"]
    # puts found_tv["release_date"]
    # puts found_tv["vote_average"]
    # puts found_tv["overview"][0..100] << "..."
  end

  # def get_title(name)
  #   response_string = RestClient.get("https://api.thetvdb.org/3/search/tv?api_key=#{ENV['API_KEY']}&query=#{name}")
  #   tv_hash = JSON.parse(response_string)
  #   found_tv = tv_hash["results"].find do |tv|
  #     tv["title"] == name
  #   end
  # end

end

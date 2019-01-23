class Movie < ActiveRecord::Base
  has_many :watchlists
  has_many :users, through: :watchlists
  has_many :actor_movies
  has_many :actors, through: :actor_movies
end

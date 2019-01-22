class Movie < ActiveRecord::Base
  has_many :watchlists
  has_many :users, through: :watchlists
end

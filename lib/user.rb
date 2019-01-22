class User < ActiveRecord::Base
  has_many :watchlists
  has_many :movies, through: :watchlists
end

class Watchlist < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  attr_accessor :name



end

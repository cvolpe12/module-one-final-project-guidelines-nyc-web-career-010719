class Watchlist < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
end

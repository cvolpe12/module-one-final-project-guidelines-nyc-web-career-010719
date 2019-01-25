class Watchlist < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
  belongs_to :tv_show
end

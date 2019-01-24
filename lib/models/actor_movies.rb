class ActorTv < ActiveRecord::Base
  belongs_to :movie
  belongs_to :actor
end

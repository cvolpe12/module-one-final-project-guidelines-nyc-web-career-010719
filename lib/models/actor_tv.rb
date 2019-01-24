class ActorMovie < ActiveRecord::Base
  belongs_to :tv
  belongs_to :actor
end

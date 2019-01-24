class User < ActiveRecord::Base
  has_many :watchlists
  has_many :movies, through: :watchlists

  def self.authenticate(user_name, password)
    where(user_name: user_name, password: password).first
    binding.pry
  end

end

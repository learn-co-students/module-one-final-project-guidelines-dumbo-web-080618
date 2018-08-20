class User < ActiveRecord::Base
  has_many :decks
  has_many :questions, through: :decks

  def self.find_or_create_by_name(name)
    if(self.find_by(name: name) != nil)
      self.find_by(name: name)
    else
      User.create(name: name)
    end
  end
end
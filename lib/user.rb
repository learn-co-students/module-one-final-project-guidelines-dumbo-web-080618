class User < ActiveRecord::Base
  has_many :decks
  has_many :questions, through: :decks
end
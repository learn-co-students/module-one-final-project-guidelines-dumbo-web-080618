class Question < ActiveRecord::Base 
  has_many :decks
  has_many :users, through: :deck
  
end
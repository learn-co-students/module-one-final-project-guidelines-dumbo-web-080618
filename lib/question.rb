class Question < ActiveRecord::Base 
  belongs_to :deck
  has_many :users, through: :deck

  def get_info
    "ID: #{self.id}, Topic: #{self.topic}, Question: #{self.question}"
  end
end
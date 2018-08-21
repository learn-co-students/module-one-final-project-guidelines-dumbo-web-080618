class Store < ActiveRecord::Base
  has_many :stocks
  has_many :sneakers, through: :stocks
end

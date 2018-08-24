class Shoe < ActiveRecord::Base
  has_many :stocks
  has_many :stores, through: :stocks
end

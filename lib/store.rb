class Store < ActiveRecord::Base
  has_many :stocks
  has_many :shoes, through: :stocks
end

class Store < ActiveRecord::Base
  has_many :stocks
  has_many :shoes, through: :stocks

  def add_stock

  end

  def remove_stock

  end
end

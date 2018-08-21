class Legislator < ActiveRecord::Base
  has_many :users

  def initialize(name)
    @name = name
  end


end

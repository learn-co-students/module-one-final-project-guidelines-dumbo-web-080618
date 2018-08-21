class User < ActiveRecord::Base
  belongs_to :senator
  belongs_to :governor

  attr_accessor :name, :age, :gender, :party

  def initialize(name, age, gender, party)
    @name = name
    @age = age
    @gender = gender
    @party = party
  end


end

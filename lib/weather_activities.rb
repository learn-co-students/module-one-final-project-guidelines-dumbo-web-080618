class WeatherActivity < ActiveRecord::Base

  belongs_to :activity
  belongs_to :weather

  # def self.random_activity
  #   binding.pry
  # end


end

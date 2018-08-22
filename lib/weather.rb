class Weather < ActiveRecord::Base

  has_many :weather_activities
  has_many :activities, through: :weather_activities

  def self.random_condition
    conditions = Weather.all.map{|weather| weather.condition}
    conditions.sample
  end

end

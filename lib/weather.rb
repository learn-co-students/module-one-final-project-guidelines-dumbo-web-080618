class Weather < ActiveRecord::Base

  has_many :weather_activities
  has_many :activities, through: :weather_activities

  def self.all_weather_types
    Weather.all.map do |weather|
      weather
      #Weather Objects
    end
  end

  # def self.weather_type
  #   Weather.all_weather_types.map do |weather|
  #     weather.condition
  #     #Weather Condition/Strings
  #   end
  # end

end

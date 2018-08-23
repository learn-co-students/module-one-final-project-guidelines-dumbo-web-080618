class Activity < ActiveRecord::Base

  has_many :weather_activities
  has_many :weathers, through: :weather_activities

  # def activities_for_weather
  #   #list all activities for each weather condition
  # end
end

class Weather < ActiveRecord::Base

  has_many :weather_activities
  has_many :activities, through: :weather_activities

end

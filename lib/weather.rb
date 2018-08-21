class Weather < ActiveRecord::Base

  has_many :weather_activities
  has_many :activity, through: :weather_activities

end

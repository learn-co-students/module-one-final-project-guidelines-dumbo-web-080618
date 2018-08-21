class Activity < ActiveRecord::Base

  has_many :weather_activities
  has_many :weather, through: :weather_activities

end

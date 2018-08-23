class Activity < ActiveRecord::Base

  has_many :weather_activities
  has_many :weathers, through: :weather_activities


end

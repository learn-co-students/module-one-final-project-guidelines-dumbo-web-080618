class Weather < ActiveRecord::Base

  has_many :weather_activities
  has_many :activities, through: :weather_activities

  def self.all_weather_types
    Weather.all.map do |weather|
      weather
    end
  end

  def weather_activities
    self.activities.map{|activity| activity.title}
  end


end

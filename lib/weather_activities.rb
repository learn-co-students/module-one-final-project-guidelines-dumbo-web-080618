class WeatherActivity < ActiveRecord::Base

  belongs_to :activity
  belongs_to :weather


end

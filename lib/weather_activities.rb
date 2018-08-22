class WeatherActivity < ActiveRecord::Base

  belongs_to :activity
  belongs_to :weather

  def self.random_activity
    binding.pry
    # activities = self.all.map{|activity| activity.title}
    # activities.sample
  end


end

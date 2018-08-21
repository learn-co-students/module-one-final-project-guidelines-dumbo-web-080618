class CreateWeatherActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :weather_activities do |t|
      t.integer :activity_id
      t.integer :weather_id
    end
  end
end

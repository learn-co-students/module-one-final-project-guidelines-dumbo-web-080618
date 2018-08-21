require_relative "../lib/activity.rb"
require_relative "../lib/weather.rb"
require_relative "../lib/weather_activities.rb"

Activity.destroy_all
Weather.destroy_all
WeatherActivity.destroy_all


######################activity_variables################################

tennis = Activity.create(title: "Tennis", category: "Physical")
meditate = Activity.create(title: "Meditation", category: "Mental")
jog = Activity.create(title: "Jogging", category: "Physical")
museum = Activity.create(title: "Visit a Museum", category: "Educational")
movies = Activity.create(title: "Go to a movie", category: "Leisure")

######################weather_variables#################################

rain = Weather.create(condition: "Raining")
sunny = Weather.create(condition: "Sunny")
cloudy = Weather.create(condition: "Cloudy")

######################weather_activities_variables######################

activity_1 = WeatherActivity.create(activity: jog, weather: sunny)
activity_2 = WeatherActivity.create(activity: museum, weather: rain)
activity_3 = WeatherActivity.create(activity: movies, weather: cloudy)

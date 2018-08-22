require_relative "../lib/activity.rb"
require_relative "../lib/weather.rb"
require_relative "../lib/weather_activities.rb"

# Activity.destroy_all
# Weather.destroy_all
# WeatherActivity.destroy_all


######################activity_variables################################

tennis = Activity.create(title: "Tennis", category: "Physical")
snowboarding = Activity.create(title: "Snowboarding", category: "Physical")
pool = Activity.create(title: "Swimming", category: "Physical")
museum = Activity.create(title: "Visit a Museum", category: "Educational")
movies = Activity.create(title: "Go to a movie", category: "Leisure")

######################weather_variables#################################

rain = Weather.create(condition: "a rainy day")
sunny = Weather.create(condition: "a sunny day")
cloudy = Weather.create(condition: "a cloudy day")
humid = Weather.create(condition: "humidity")
snow = Weather.create(condition: "a mild snowstorm")

######################weather_activities_variables######################

swimming = WeatherActivity.create(activity: pool, weather: humid)
visit_museum = WeatherActivity.create(activity: museum, weather: cloudy)
movie_theater = WeatherActivity.create(activity: movies, weather: rain)
hit_the_slopes = WeatherActivity.create(activity: snowboarding, weather: snow)
play_tennis = WeatherActivity.create(activity: tennis, weather: sunny)

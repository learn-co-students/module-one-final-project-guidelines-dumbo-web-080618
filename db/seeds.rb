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
basketball = Activity.create(title: "Play Basketball", category: "Physical")
hiking = Activity.create(title: "Go Hiking", category: "Physical")
skiing = Activity.create(title: "Skiing", category: "Physical")
snowman = Activity.create(title: "Build a snowman", category: "Leisure")
video_games = Activity.create(title: "Play video games", category: "Leisure")
sleeping = Activity.create(title: "Take a nap", category: "Relaxation")
ac = Activity.create(title: "Sit infront of air conditioner", category: "Relaxation")

######################weather_variables#################################

rain = Weather.create(condition: "a rainy day")
sunny = Weather.create(condition: "a sunny day")
humid = Weather.create(condition: "humidity")
snow = Weather.create(condition: "a mild snowstorm")

######################weather_activities_variables######################

swimming = WeatherActivity.create(activity: pool, weather: humid)
visit_museum = WeatherActivity.create(activity: museum, weather: rain)
movie_theater = WeatherActivity.create(activity: movies, weather: rain)
hit_the_slopes = WeatherActivity.create(activity: snowboarding, weather: snow)
play_tennis = WeatherActivity.create(activity: tennis, weather: sunny)
play_bball = WeatherActivity.create(activity: basketball, weather: sunny)
hike = WeatherActivity.create(activity: hiking, weather: sunny)
ski = WeatherActivity.create(activity: skiing, weather: snow)
build_snowman = WeatherActivity.create(activity: snowman, weather: snow)
videogames = WeatherActivity.create(activity: video_games, weather: rain)
nap = WeatherActivity.create(activity: sleeping, weather: humid)
sit_ac = WeatherActivity.create(activity: ac, weather: humid)

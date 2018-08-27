require_relative "../lib/activity.rb"
require_relative "../lib/weather.rb"
require_relative "../lib/weather_activities.rb"

# Activity.destroy_all
# Weather.destroy_all
# WeatherActivity.destroy_all


######################activity_variables################################

tennis = Activity.create(title: "playing a match of tennis", category: "Physical")
snowboarding = Activity.create(title: "snowboarding", category: "Physical")
pool = Activity.create(title: "swimming", category: "Physical")
museum = Activity.create(title: "visiting a Museum", category: "Educational")
movies = Activity.create(title: "a day at the movie theater", category: "Leisure")
basketball = Activity.create(title: "a game of basketball", category: "Physical")
hiking = Activity.create(title: "a good hike", category: "Physical")
skiing = Activity.create(title: "skiing", category: "Physical")
snowman = Activity.create(title: "building a snowman", category: "Leisure")
video_games = Activity.create(title: "playing video games", category: "Leisure")
sleeping = Activity.create(title: "taking a nap", category: "Relaxation")
ac = Activity.create(title: "sitting infront of an air conditioner", category: "Relaxation")
in_concert = Activity.create(title: "going to an indoor concert", category: "Leisure")
out_concert = Activity.create(title: "going to an outdoor concert", category: "Leisure")
bike_riding = Activity.create(title: "going for a bike ride", category: "Physical")
fireplace = Activity.create(title: "sitting by a fireplace", category: "Relaxation")
hot_cocoa = Activity.create(title: "drinking some hot cocoa", category: "Relaxation")
snowball_fight = Activity.create(title: "having a snowball fight", category: "Leisure")
sledding = Activity.create(title: "finding a steep hill and a garbage can lid to go sledding", category: "Relaxation")
ice_skating = Activity.create(title: "going ice-skating", category: "Physical")
skateboard = Activity.create(title: "going skateboarding", category: "Physical")
rollerblade = Activity.create(title: "going rollerblading", category: "Physical")
sing = Activity.create(title: "singing in the rain", category: "Leisure")
dance = Activity.create(title: "dancing in the rain", category: "Leisure")
book = Activity.create(title: "reading a book", category: "Leisure")
sad = Activity.create(title: "being sad", category: "Relaxation")
secret_activity = Activity.create(title: "rolling with god mon", category: "Relaxation")


######################weather_variables#################################

rain = Weather.create(condition: "a rainy day")
sunny = Weather.create(condition: "a sunny day")
snow = Weather.create(condition: "a mild snowstorm")

######################weather_activities_variables######################

swimming = WeatherActivity.create(activity: pool, weather: sunny)
visit_museum = WeatherActivity.create(activity: museum, weather: rain)
movie_theater = WeatherActivity.create(activity: movies, weather: rain)
hit_the_slopes = WeatherActivity.create(activity: snowboarding, weather: snow)
play_tennis = WeatherActivity.create(activity: tennis, weather: sunny)
play_bball = WeatherActivity.create(activity: basketball, weather: sunny)
hike = WeatherActivity.create(activity: hiking, weather: sunny)
ski = WeatherActivity.create(activity: skiing, weather: snow)
build_snowman = WeatherActivity.create(activity: snowman, weather: snow)
videogames = WeatherActivity.create(activity: video_games, weather: rain)
nap = WeatherActivity.create(activity: sleeping, weather: sunny)
sit_ac = WeatherActivity.create(activity: ac, weather: sunny)
indoor_concert = WeatherActivity.create(activity: in_concert, weather: rain)
outdoor_concert = WeatherActivity.create(activity: out_concert, weather: sunny)
bike_ride = WeatherActivity.create(activity: bike_riding, weather: sunny)
sit_fire = WeatherActivity.create(activity: fireplace, weather: snow)
cocoa = WeatherActivity.create(activity: hot_cocoa, weather: snow)
snowball = WeatherActivity.create(activity: snowball_fight, weather: snow)
sled = WeatherActivity.create(activity: sledding, weather: snow)
skate_ice = WeatherActivity.create(activity: ice_skating, weather: snow)
skateboarding = WeatherActivity.create(activity: skateboard, weather: sunny)
roller = WeatherActivity.create(activity: rollerblade, weather: sunny)
singing = WeatherActivity.create(activity: sing, weather: rain)
dancing = WeatherActivity.create(activity: dance, weather: rain)
read = WeatherActivity.create(activity: book, weather: rain)
be_sad = WeatherActivity.create(activity: sad, weather: rain)
mon = WeatherActivity.create(activity: secret_activity, weather: rain)

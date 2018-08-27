require_relative '../config/environment'

$random_weather = Weather.all_weather_types.sample

def current_time
  time = Time.new

  if time.hour >= 00 && time.hour < 12
    puts "Good Morning!"
  elsif time.hour >= 12 && time.hour < 17
    puts "Good Afternoon!"
  else
    puts "Good Evening!"
  end
end

# def random_weather_condition
#   Weather.all_weather_types.sample






def main_menu
# $random_weather = random_weather_condition
  puts
  puts "#{current_time}"
  puts "Welcome to Better Weather CLI!"
  puts
  puts "Today's weather is #{$random_weather.condition}."
  # puts
  # puts "Today's weather is perfect for #{$random_weather.weather_activities.sample}."
  puts
  prompt = TTY::Prompt.new

  w = prompt.select("   Menu
 --------") do |menu|
    menu.choices 'Activities' => 'all_activities', 'Weather' => 'all_weather',
    "Exit" => "exit"
    # clear_screen
  end

    case w
    when 'exit'
      clear_screen
      puts "Thank you for visiting Better Weather CLI!"
      exit
    when 'all_weather'
      weathers
    when 'all_activities' # need activities .. but weathers calls it
      all_activities($random_weather)
    when 'exit'
      exit
end
end

def all_activities(s)
  clear_screen
  conditions = WeatherActivity.where(weather: s)
  options = []
  conditions.each {|weatheract| options.push({name: "#{weatheract.activity.title}", value: weatheract})}
  prompt = TTY::Prompt.new
  w = prompt.select("Choose an activity to do today!", options)
  clear_screen
  que = prompt.yes?("Are you happy with your selection?")
  case que
  when true
    clear_screen
    puts "Have a great time #{w.activity.title}"
    puts
    puts "Thank you for visiting Better Weather CLI!"
  when false
    clear_screen
    all_activities(s)
  # when 'exit'
  #   exit
  end
end

def weathers
  # conditions = WeatherActivity.where(weather: @random_weather)
  options = []
  Weather.all.each {|weather| options.push({name: "#{weather.condition}", value: weather})}
  prompt = TTY::Prompt.new
  clear_screen
  w = prompt.select("Choose a type of weather:", options)
  all_activities(w)
end

main_menu

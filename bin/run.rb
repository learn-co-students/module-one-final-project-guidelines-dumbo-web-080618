require_relative '../config/environment'


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

def random_weather_condition
  Weather.all_weather_types.sample
end

def access_menu
  alt = main_menu
  loop do
    case alt
    when 'end'
      clear_screen
      puts "Thank you for visiting Better Weather CLI!"
      break
    else
      alt = activity_menu(alt)
    end
  end
end

def main_menu
  prompt = TTY::Prompt.new
  current_weather = random_weather_condition

  prompt.select("
    _______       __   __                  ___ ___             __   __
|   _   .-----|  |_|  |_.-----.----.   |   Y   .-----.---.-|  |_|  |--.-----.----.
|.  1   |  -__|   _|   _|  -__|   _|   |.  |   |  -__|  _  |   _|     |  -__|   _|
|.  _   |_____|____|____|_____|__|     |. / \  |_____|___._|____|__|__|_____|__|
|:  1    \                             |:      |
|::.. .  /                             |::.|:. |
`-------'                              `--- ---'
    #{current_time}
    Can't think of something to do today?
    Welcome to Better Weather CLI!
    Today's weather calls for #{current_weather.condition}.
    ") do |menu|
    menu.choice 'activity', current_weather
    menu.choice 'end', 'end'
  end
end

def activity_menu(current_weather)
  prompt = TTY::Prompt.new
  random_activity = current_weather.weather_activities
  prompt.select("Today's weather is perfect for #{random_activity.sample}.") do |menu|
    menu.choice 'different suggestion', current_weather
    menu.choice 'end', 'end'
    clear_screen
  end
end


access_menu

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
    clear_screen
  end
end

def activity_menu(current_weather)
  prompt = TTY::Prompt.new
  random_activity = current_weather.weather_activities
  prompt.select("Today's weather is perfect for #{random_activity.sample}.") do |menu|
    menu.choice 'different suggestion', current_weather
    #menu.choice 'choose activity', current_weather
    menu.choice 'end', 'end'
    clear_screen
  end
end

# access_menu
binding.pry
0

#######################steps###############################



#1st|b| - format intro - example below -- below intro is prompt for *next* or *exit* or *help*
#_____________________________________________________________________________________
#Good morning/afternoon/evening!. Can't think of something to do today?
#Welcome to Better Weather CLI! Today's weather is #{weather instance}
#        => next
#        => help or 'h'
#        => exit

#   - find a way to fetch time off user's computer and use that information to determine
#       whether to greet with morning/afternoon/night (current_time method)

#   - define random weather method in weather class
#
#_____________________________________________________________________________________





#2nd|a| - next - what happens when next is selected - outputs a random activity when
#                   certain conditions are met

#_________________________________________________________________
#Today's weather is perfect for jogging!
#             => Different activity!
#             => exit
#_________________________________________________________________





#3rd|b| - exit - if exit is selected then output message

#_________________________________________________________________
#Thank you for visiting Better Weather CLI!
#_________________________________________________________________

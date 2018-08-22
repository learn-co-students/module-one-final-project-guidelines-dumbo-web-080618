require_relative '../config/environment'
require 'pry'

#test anything in here

#first welcome user
#ask if they would like to find a senator or house representative
#ask for their state
#then display senators or representatives from that state
#then asked them to pick a senator or representative from that state that they
#would like to view
#create done viewing command option
#when they are done viewing that representative ask if they would like to
#find someone else or donate to that legislator
#choose where to continue browsing or quit

# house_reps = Legislator.all.select {|legislator| legislator.title == 'rep'}

puts 'Welcome! Please select where you would like to find a senator or house representative'
senator_or_rep_input = gets.chomp

def modify_senator_rep_input(userInput)
  if userInput.downcase == 'senator'
    return userInput = userInput.slice(0..2)
  elsif userInput.downcase == 'house representative'
    return userInput = userInput.slice(6..8)
  else
    puts "Please type the words senator or house representative"
  end
end

modified_input = modify_senator_rep_input(senator_or_rep_input)

puts "Great, to look for your #{senator_or_rep_input} we will need to type your state below"
state_input = gets.chomp


def modify_state_input(state_input)
  states_fullname = ["Alaska", "Alabama", "Arkansas", "American Samoa", "Arizona",
                  "California",
                  "Colorado",
                  "Connecticut",
                  "District of Columbia",
                  "Delaware",
                  "Florida",
                  "Georgia",
                  "Guam",
                  "Hawaii",
                  "Iowa",
                  "Idaho",
                  "Illinois",
                  "Indiana",
                  "Kansas",
                  "Kentucky",
                  "Louisiana",
                  "Massachusetts",
                  "Maryland",
                  "Maine",
                  "Michigan",
                  "Minnesota",
                  "Missouri",
                  "Mississippi",
                  "Montana",
                  "North Carolina",
                  " North Dakota",
                  "Nebraska",
                  "New Hampshire",
                  "New Jersey",
                  "New Mexico",
                  "Nevada",
                  "New York",
                  "Ohio",
                  "Oklahoma",
                  "Oregon",
                  "Pennsylvania",
                  "Puerto Rico",
                  "Rhode Island",
                  "South Carolina",
                  "South Dakota",
                  "Tennessee",
                  "Texas",
                  "Utah",
                  "Virginia",
                  "Virgin Islands",
                  "Vermont",
                  "Washington",
                  "Wisconsin",
                  "West Virginia",
                  "Wyoming"]

    states_abbreviated = [ "AK",
                                  "AL",
                                  "AR",
                                  "AS",
                                  "AZ",
                                  "CA",
                                  "CO",
                                  "CT",
                                  "DC",
                                  "DE",
                                  "FL",
                                  "GA",
                                  "GU",
                                  "HI",
                                  "IA",
                                  "ID",
                                  "IL",
                                  "IN",
                                  "KS",
                                  "KY",
                                  "LA",
                                  "MA",
                                  "MD",
                                  "ME",
                                  "MI",
                                  "MN",
                                  "MO",
                                  "MS",
                                  "MT",
                                  "NC",
                                  "ND",
                                  "NE",
                                  "NH",
                                  "NJ",
                                  "NM",
                                  "NV",
                                  "NY",
                                  "OH",
                                  "OK",
                                  "OR",
                                  "PA",
                                  "PR",
                                  "RI",
                                  "SC",
                                  "SD",
                                  "TN",
                                  "TX",
                                  "UT",
                                  "VA",
                                  "VI",
                                  "VT",
                                  "WA",
                                  "WI",
                                  "WV",
                                  "WY"]


  state_abbreviated = []
  if state_input.downcase ==  || state_input.downcase ==
end


def find_by_state(who_im_looking_for, what_state_im_looking_for)
  senators_or_house_rep = Legislator.find_senator_or_houseRep(who_im_looking_for)

  senator_names = []
  senators_or_house_rep.each do |legislator|
    if legislator.state == what_state_im_looking_for
      senator_names << "#{legislator.first_name} #{legislator.last_name}\n"
    end
  end
  senator_names.uniq
end

senators_from_state = find_by_state(modified_input, state_input)
puts senators_from_state

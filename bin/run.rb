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

puts "Hello, what is your name?"
name = gets.chomp

user = User.find_by(name: name)
if user == nil
  puts 'Please enter your age.'
  age = gets.chomp
  puts 'Please enter gender.'
  gender = gets.chomp
  puts 'Please enter political party.'
  party = gets.chomp
  User.create(name:name, age: age, gender: gender, party: party)
end

binding.pry













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
  states_by_abbreviation = {
    'AL' => 'Alabama',
    'AK' => 'Alaska',
    'AS' => 'America Samoa',
    'AZ' => 'Arizona',
    'AR' => 'Arkansas',
    'CA' => 'California',
    'CO' => 'Colorado',
    'CT' => 'Connecticut',
    'DE' => 'Delaware',
    'DC' => 'District of Columbia',
    'FM' => 'Federated States Of Micronesia',
    'FL' => 'Florida',
    'GA' => 'Georgia',
    'GU' => 'Guam',
    'HI' => 'Hawaii',
    'ID' => 'Idaho',
    'IL' => 'Illinois',
    'IN' => 'Indiana',
    'IA' => 'Iowa',
    'KS' => 'Kansas',
    'KY' => 'Kentucky',
    'LA' => 'Louisiana',
    'ME' => 'Maine',
    'MH' => 'Marshall Islands',
    'MD' => 'Maryland',
    'MA' => 'Massachusetts',
    'MI' => 'Michigan',
    'MN' => 'Minnesota',
    'MS' => 'Mississippi',
    'MO' => 'Missouri',
    'MT' => 'Montana',
    'NE' => 'Nebraska',
    'NV' => 'Nevada',
    'NH' => 'New Hampshire',
    'NJ' => 'New Jersey',
    'NM' => 'New Mexico',
    'NY' => 'New York',
    'NC' => 'North Carolina',
    'ND' => 'North Dakota',
    'OH' => 'Ohio',
    'OK' => 'Oklahoma',
    'OR' => 'Oregon',
    'PW' => 'Palau',
    'PA' => 'Pennsylvania',
    'PR' => 'Puerto Rico',
    'RI' => 'Rhode Island',
    'SC' => 'South Carolina',
    'SD' => 'South Dakota',
    'TN' => 'Tennessee',
    'TX' => 'Texas',
    'UT' => 'Utah',
    'VT' => 'Vermont',
    'VI' => 'Virgin Island',
    'VA' => 'Virginia',
    'WA' => 'Washington',
    'WV' => 'West Virginia',
    'WI' => 'Wisconsin',
    'WY' => 'Wyoming'
  }

  state_fullnames_to_abbreviation = {
    'Alabama' => 'AL',
    'Alaska' => 'AK',
    'America Samoa' => 'AS',
    'Arizona' => 'AZ',
    'Arkansas' => 'AR',
    'California' => 'CA',
    'Colorado' => 'CO',
    'Connecticut' => 'CT',
    'Delaware' => 'DE',
    'District of Columbia' => 'DC',
    'Federated States of Micronesia' => 'FM',
    'Florida' => 'FL',
    'Georgia' => 'GA',
    'Guam' => 'GU',
    'Hawaii' => 'HI',
    'Idaho' => 'ID',
    'Illinois' => 'IL',
    'Indiana' => 'IN',
    'Iowa' => 'IA',
    'Kansas' => 'KS',
    'Kentucky' => 'KY',
    'Louisiana' => 'LA',
    'Maine' => 'ME',
    'Maryland' => 'MD',
    'Massachusetts' => 'MA',
    'Marshall Islands' => 'MH',
    'Michigan' => 'MI',
    'Minnesota' => 'MN',
    'Mississippi' => 'MS',
    'Missouri' => 'MO',
    'Montana' => 'MT',
    'Nebraska' => 'NE',
    'Nevada' => 'NV',
    'New Hampshire' => 'NH',
    'New Jersey' => 'NJ',
    'New Mexico' => 'NM',
    'New York' => 'NY',
    'North Carolina' => 'NC',
    'North Dakota' => 'ND',
    'Northern Mariana Islands' => 'MP',
    'Ohio' => 'OH',
    'Oklahoma' => 'OK',
    'Oregon' => 'OR',
    'Palau' => 'PW',
    'Pennsylvania' => 'PA',
    'Puerto Rico' => 'PR',
    'Rhode Island' => 'RI',
    'South Carolina' => 'SC',
    'South Dakota' => 'SD',
    'Tennessee' => 'TN',
    'Texas' => 'TX',
    'Utah' => 'UT',
    'Vermont' => 'VT',
    'Virgin Island' => 'VI',
    'Virginia' => 'VA',
    'Washington' => 'WA',
    'West Virginia' => 'WV',
    'Wisconsin' => 'WI',
    'Wyoming' => 'WY'
  }

  if states_by_abbreviation.key?(state_input.upcase)
    return state_input.upcase
  elsif state_fullnames_to_abbreviation.key?(state_input.capitalize)
    return state_fullnames_to_abbreviation[state_input.capitalize]
  end
end

modified_state_input = modify_state_input(state_input)



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

senators_from_state = find_by_state(modified_input, modified_state_input)

puts senators_from_state

puts "Please select the person you would like to learn more about."



binding.pry

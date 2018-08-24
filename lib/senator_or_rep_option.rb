def choose_sen_or_rep
  puts "Would you like to view your state Senators or Representatives?"
  puts "Please type the word senator or house representative"

  user_input = gets.chomp
end


def modify_senator_rep_input(userInput)
  if userInput.downcase == 'senator'
    return userInput = userInput.slice(0..2)
  elsif userInput.downcase == 'house representative'
    return userInput = userInput.slice(6..8)
  else
    puts "Please type the words senator or house representative"
  end
end

def find_sen_or_rep(searchfor)
  searchfor = searchfor.slice(0,3)
  legislatorArray = Legislator.all.select {|legislator| legislator.title == searchfor}
  legislatorArray.each_with_index do |legislator,  index|
    puts "#{index + 1}. #{legislator}"
  end

end

def get_state(user_input)
  puts "Great, to look for your #{user_input} we will need to type your state below"
  state_input = gets.chomp
end

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

def find_by_state_and_rep(who_im_looking_for, what_state_im_looking_for)
  senators_or_house_rep = Legislator.find_senator_or_houseRep(who_im_looking_for)

  senator_names = []
  senators_or_house_rep.each do |legislator|
    if legislator.state == what_state_im_looking_for
      senator_names << "#{legislator.first_name} #{legislator.last_name}\n"
    end
  end
  senator_names.uniq
end

def find_by_name(incoming_name)
  legislator_name = incoming_name.slice(0..incoming_name.length-2).split(' ')
  first_name = legislator_name[0]
  last_name = legislator_name[1]
  legislators_that_match_first_name = Legislator.all.select do |legislator|
    legislator.first_name = first_name
  end

  found_legislator = legislators_that_match_first_name.find do |legislator|
    legislator.last_name == last_name
  end

end

def display_chosen_legislator(num, legislator_array)
  full_name = legislator_array[num]
  find_by_name(full_name)
end



def choose_menu
  user_input = choose_sen_or_rep
  modified_rep_input = modify_senator_rep_input(user_input)
  state_input = get_state(user_input)
  modified_state_input = modify_state_input(state_input)
  legislator_array = find_by_state_and_rep(modified_rep_input, modified_state_input)
  display(legislator_array)
  num = select_option
  num = num.to_i
  person = view_legislator(num, legislator_array)
  display_info(person)
  ask_user_donation_yes_no(person)
  #make_donation(legislator_array[num-1])
end

def display_info(person)
    puts "This is #{person.first_name} #{person.last_name}'s information:
    Title: #{person.title.capitalize}.\n
    State: #{person.state}\n
    Address: #{person.address}\n
    Phone number: #{person.phone}\n
    Website: #{person.url}"
end

def view_legislator(num, legislator_array)
  legislator_name = legislator_array[num-1]
  find_by_name(legislator_name)
end

def display(legislator_array)
  legislator_array.each_with_index {|val, index| puts "#{index + 1}. #{val}"}
end

def select_option
  puts "Please enter the number of the person you would like to view."
  user_input = gets.chomp
end

def quit
  puts "Are you sure you want to quit? Type yes or no."
  user_input = gets.chomp
  if user_input.downcase == "yes"
    puts "Thanks for visiting"
    #put in a break!!!!!!
  elsif user_input.downcase == "no"
    choose_menu
  end
end

def ask_user_donation_yes_no(person)
  puts "Would you like to make a donation? Type yes or no."
  user_input = gets.chomp
  if user_input.downcase == "yes"
    make_donation(person)
  else
    puts "Type 'quit' to exit or 'view' to view another representative."
    user_input = gets.chomp
    if user_input.downcase == "quit"
      quit
    elsif user_input.downcase == "view"
      choose_menu
    else
      puts "Type 'quit' to exit or 'view' to view another representative."
    end
  end
end

def make_donation(legislator_obj)
  puts "To make a donation, please confirm your name and age."
  user = validation
  puts "Please confirm this is legislator you would like to donate to."
  puts "#{legislator_obj.full_name}"
  puts "Enter 1 for yes or 2 for no"
  user_input = gets.chomp
  puts 'Please enter the amount you would like to donate'
  amount_input = gets.chomp.to_i
  if user_input == '1'
    user.donate(legislator_obj.id, amount_input)
    puts "Thank you for making a donation"
  else
    puts "Please type your representative name again"
    correct_name = gets.chomp
    nameArray = correct_name.split(' ')
    first_name = nameArray[0]
    last_name = nameArray[1]
    Legislator.find_by(first_name: first_name, last_name: last_name)
    puts "Please confirm this is the legislator you would like to donate to."
    puts "#{legislator_obj.full_name}"
    puts "Enter 1 for yes or 2 for no"
    user_input_again = gets.chomp
    if user_input == '1'
      user.donate(legislator_obj.id, amount_input)
      puts 'Thank you for making a donation'
    else
      puts "Sorry it doesn't seem like we have that legislator"
      puts "Type 'quit' to exit or 'view' to view another representative."
      user_input = gets.chomp
      if user_input.downcase == "quit"
        quit
      elsif user_input.downcase == "view"
        choose_menu
      end
    end
  end
end

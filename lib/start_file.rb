def welcome
  puts 'Welcome to the legislators app.  Here you can find a legislator read about them and donate to
  a specific campaign.'
end

def get_name
  puts "Please enter a name"
  name = gets.chomp

  if name == ''
    get_name
  end
end

def get_age
  puts 'Please enter your age.'
  age = gets.chomp.to_i
  if age == 0
    get_age
  end
end

def gender
  puts 'Please enter gender.'
  gender = gets.chomp
  if gender == ''
    gender
  end
end

def party
  puts 'Please enter political party.'
  party = gets.chomp
end

def sign_up
  user_name = get_name
  user_age = get_age
  user_gender = gender
  user_party = party
  User.create(name: user_name, age: user_age, gender: user_gender, party: user_party)
end

def validation
  user_name = get_name
  user_age = get_age
  user = User.find_by(name: user_name, age: user_age)
  if user.age == user_age
    return user
  else
    puts "You weren't found in the database"
    sign-up
  end
end

def start_menu
  welcome
  puts 'Hey would you like to sign-up or login?'
  user_input = gets.chomp

  if user_input.downcase == 'login'
    validation
  elsif user_input.downcase == 'sign-up'
    sign_up
  else
    puts "Please enter 'login' or 'sign-up'"
    start_menu
  end
end

def login
  puts "Welcome to the Learning Zone. Do you have an account?"
  puts "(1) Yes, I would like to log-in"
  puts "(2) No, I would like to create an account"
    input = gets.chomp

    if input == "1"
      login_account
    elsif input == "2"
      create_account
    end

  # name = gets.chomp
  # user = User.find_or_create_by_name(name)
  # puts "Hello #{user.name}, user #{user.id}."
  # user

end

def login_account
  puts "What is your Username?"
    username = gets.chomp

    if User.find_by(name: username) != nil
      user = User.find_by(name: username)
        puts "What is your Password"
        password = gets.chomp
          if Base64.encode64(password) == user.password
            return user
          else
            puts "Invalid Username or Password. Please try again"
            login_account
          end
    else
      puts "The account name does not exist. Please try again"
      login_account
    end









end

def create_account
  puts "Please choose a Username"
  username = gets.chomp
    if User.find_by(name: username) != nil
      puts "That username already exists."
      create_account
    end
  puts "Please choose a password"
  password = gets.chomp
  password = Base64.encode64(password)
  user = User.create(name: username, password: password)
  return user
end


















####

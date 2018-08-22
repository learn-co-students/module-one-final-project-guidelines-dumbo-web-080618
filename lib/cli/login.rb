
def login
  logo
  # puts "Welcome to the Learning Zone. Do you have an account?".colorize(:yellow)
  # puts "(1) Yes, I would like to log-in".colorize(:cyan)
  # puts "(2) No, I would like to create an account".colorize(:cyan)

    input = prompt.yes?("Do you have an account?")

    if input == true
      clear_screen
      logo
      login_account
    elsif input == false
      clear_screen
      logo
      create_account
    end

  # name = gets.chomp
  # user = User.find_or_create_by_name(name)
  # puts "Hello #{user.name}, user #{user.id}."
  # user

end

def login_account
  puts "What is your Username?".colorize(:yellow)
    username = gets.chomp

    if User.find_by(name: username) != nil
      user = User.find_by(name: username)
        puts "What is your Password ?".colorize(:yellow)
        password = gets.chomp
          if Base64.encode64(password) == user.password
            return user
          else
            clear_screen
            logo
            puts "Invalid Username or Password. Please try again".colorize(:red)
            login_account
          end
    else
      puts "The account name does not exist. Please try again".colorize(:red)
      login_account
    end









end

def create_account
  puts "Please choose a Username"
  username = gets.chomp
    if User.find_by(name: username) != nil
      clear_screen
      logo
      puts "That username already exists. Please chooser a different username"
      create_account
    end
  puts "Please choose a password"
  password = gets.chomp
  password = Base64.encode64(password)
  user = User.create(name: username, password: password)
  return user
end


















####

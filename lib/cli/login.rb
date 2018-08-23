
def login
  logo
  # puts "Welcome to the Learning Zone. Do you have an account?".colorize(:yellow)
  # puts "(1) Yes, I would like to log-in".colorize(:cyan)
  # puts "(2) No, I would like to create an account".colorize(:cyan)

    # input = prompt.yes?("Do you have an account?")


    input = prompt.select("Do you have an account?") do |menu2|
      menu2.choice 'Yes, let me log-in', 1
      menu2.choice 'No, I would like to create one', 2
    end

    if input == 1
      clear_screen
      logo
      login_account
    elsif input == 2
      clear_screen
      logo
      create_account
    end

  # name = gets.strip
  # user = User.find_or_create_by_name(name)
  # puts "Hello #{user.name}, user #{user.id}."
  # user

end

def login_account
  puts "What is your Username?".colorize(:yellow)
    username = gets.strip

    if User.find_by(name: username) != nil
      user = User.find_by(name: username)
      #it works now
      password = prompt.mask('What is your Password?')
      loop do break if password != nil
        password = prompt.mask("What is your Password?")
      end
          if Base64.encode64(password) == user.password
            return user
          elsif Base64.encode64(password) != user.password || password == nil
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
  username = gets.strip
    if (User.find_by(name: username) != nil )
      clear_screen
      logo
      puts "That username already exists. Please chooser a different username"
      create_account
    elsif username.length == 0
      clear_screen
      logo
      puts "You didnt type anything"
      create_account
    end
  same_pass = false
  set_password = nil #used to pass the actual passcode
  while !same_pass
    password1 = prompt.mask("Please choose a password")
      loop do 
        break if password1 != nil
        password1 = prompt.mask("Please choose a password")
      end
    password2 = prompt.mask("Please repeat that password")
    if password1 == password2
      set_password = password1
      set_password = Base64.encode64(set_password)
      same_pass = true
    else
      clear_screen
      logo
      puts "Password re-entry not the same!".colorize(:red)
      same_pass = false
    end
    clear_screen
  end


  user = User.create(name: username, password: set_password)
  return user
end


















####


def login
  logo
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
end

def login_account
  puts "What is your Username?".colorize(:yellow)
    username = gets.strip

    if User.find_by(name: username) != nil
      user = User.find_by(name: username)
      #it works now
      password = prompt.mask('What is your Password?')
      loop do break if password != nil
        clear_screen
        logo
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
      clear_screen
      logo
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
    clear_screen
    logo
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
  end
  are_you_sure = prompt.select("Please confirm your condentials. Yes to confirm, No to cancel.\nUsername: #{username} & Password: #{set_password}"){|menu|
    menu.choice 'Yes', 1
    menu.choice 'No', 2
  }
  if are_you_sure == 1
    user = User.create(name: username, password: set_password)
    return user
  else
    clear_screen
    logo
    create_account
  end

end


















####

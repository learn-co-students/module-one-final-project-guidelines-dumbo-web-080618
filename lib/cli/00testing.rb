def main_test(user)
  stuff = gets.strip

  num_of_selections(stuff)
end

def num_of_selections(args)
  choices = args.split(',')
  choosen = prompt.select("Here are your choices\n", choices)
  # puts choosen
  exit = prompt.select(""){ |menu|
    menu.choice 'Exit', 1
  }
  if exit == 1
    clear_screen
    logo
    return
  end
end
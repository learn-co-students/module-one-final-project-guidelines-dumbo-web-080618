def make_a_new_card(user)
  clear_screen
  logo
  # puts "Welcome #{user.name}. What would you like to do?".colorize(:yellow)
  # puts "(1) Add a new card".colorize(:cyan)
  # puts "(2) Go back to Main Menu".colorize(:red)

  choice = prompt.select("Welcome #{user.name}! What would like to do?") do |menu|
    menu.choice 'Add a new card', 1
    menu.choice 'Go back to Main Menu', 2
  end


  if choice == 2
    return
  elsif choice != 1 && choice != 2
    clear_screen
    logo
    puts "Please give a valid choice".colorize(:red)
    make_a_new_card(user)
  end

  while choice == 1
    clear_screen
    logo
    puts "Make a new card. Please provide a topic".colorize(:cyan)
    topic = gets.chomp
    puts "Topic is #{topic}. What is the Question you would like it add?".colorize(:yellow)
    question = gets.chomp
    puts "What is the answer to your question?".colorize(:yellow)
    answer = gets.chomp

    user.find_or_create_question(topic, question, answer)

    clear_screen
    logo

    choice = prompt.select("The question card has been") do |menu|
      menu.choice 'Add a new card', 1
      menu.choice 'Go back to Main Menu', 2
    end
  end
  clear_screen
  logo


end

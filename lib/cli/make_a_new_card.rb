def make_a_new_card(user)
  clear_screen
  puts "Welcome #{user.name}. What would you like to do?".colorize(:yellow)
  puts "(1) Add a new card".colorize(:cyan)
  puts "(2) Go back to Main Menu".colorize(:red)

  choice = gets.chomp

  if choice == "2"
    clear_screen
    return
  elsif choice != "1" && choice != "2"
    clear_screen
    puts "Please give a valid choice".colorize(:red)
    make_a_new_card(user)
  end

  while choice == "1"
    clear_screen
    puts "Make a new card. Please provide a topic".colorize(:cyan)
    topic = gets.chomp
    puts "Topic is #{topic}. What is the Question you would like it add?".colorize(:yellow)
    question = gets.chomp
    puts "What is the answer to your question?".colorize(:yellow)
    answer = gets.chomp

    user.find_or_create_question(topic, question, answer)

    clear_screen

    puts "The question card has been added to your deck with the topic: #{topic}.".colorize(:red)
    puts "Would you like to do?".colorize(:yellow)
    puts "(1) add another question".colorize(:cyan)
    puts "(2) go back to main menu".colorize(:red)
    choice = gets.chomp

  end
clear_screen


end

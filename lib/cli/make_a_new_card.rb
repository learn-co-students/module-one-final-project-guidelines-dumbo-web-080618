def make_a_new_card(user)
  system "clear" or system "cls"
  puts "Welcome #{user.name}. What would you like to do?"
  puts "(1) Add a new card"
  puts "(2) Go back to Main Menu"

  choice = gets.chomp

  if choice == "2"
    return
  elsif choice != "1" && choice != "2"
    clear_screen
    puts "Please give a valid choice"
    make_a_new_card(user)
  end

  while choice == "1"
    system "clear" or system "cls"
    puts "Make a new card. Please provide a topic"
    topic = gets.chomp
    puts "Topic is #{topic}. What is the Question you would like it add?"
    question = gets.chomp
    puts "What is the answer to your question?"
    answer = gets.chomp

    user.find_or_create_question(topic, question, answer)

    system "clear" or system "cls"

    puts "The question card has been added to your deck with the topic: #{topic}."
    puts "Would you like to do?"
    puts "(1) add another question"
    puts "(2) go back to main menu"
    choice = gets.chomp
  end



end

def update_or_delete_a_card(user)
  # puts "What would you like to do?"
  # puts "(1) Update an existing Question"
  # puts "(2) Delete a Question from your deck"
  # puts "(3) Go back to Main Menu"
  clear_screen
  logo
  if user.questions.empty?
    return puts "You have no questions".colorize(:red)
  end

  choice = menu(user)

    if choice == 1
      update_card(user)
      return
    elsif choice == 2
      delete_card(user)
      return
    elsif choice == 3
    else
      puts "Please pick a valid choice".colorize(:red)
      choice = menu(user)
    end
  end


def menu(user)
  # puts "What would you like to do?".colorize(:yellow)
  # puts "(1) Update an existing Question".colorize(:cyan)
  # puts "(2) Delete a Question from your deck".colorize(:cyan)
  # puts "(3) Go back to Main Menu".colorize(:red)
  prompt.select("Welcome #{user.name}! What would like to do?") do |menu|
    menu.choice 'Update an existing Question', 1
    menu.choice 'Delete a Question from your deck', 2
    menu.choice 'Go back to Main Menu', 3
  end
end


def update_card(user)
  clear_screen
  logo
  user = update_user(user)
  questions = user.questions
 
  all_questions = questions.map{|e_quest| e_quest.question}

  question_selected = prompt.select("Please choose the question you want to update", all_questions)

# if (questions.find{|question| question.id == q_id.to_i} != nil)
if (questions.find{|query| query.question == question_selected} != nil)
  question = Question.find_by(:question => question_selected)

  change = prompt.select("What would you like to update?") do |menu1|
    menu1.choice 'The Topic: ' + question.topic, 1
    menu1.choice 'The Question: '+ question.question, 2
    menu1.choice 'The Answer: '+ question.answer, 3
    menu1.choice 'Exit', 4
  end


    if change == 1
      clear_screen
      logo
      user = update_user(user)
      puts "What is the new topic?".colorize(:yellow)
      new_topic = gets.chomp
      question.topic = new_topic
      clear_screen
      logo
      puts "The topic has been updated".colorize(:cyan)
      question.save
      return

    elsif change == 2
      clear_screen
      logo
      user = update_user(user)
      puts "What is the new question?".colorize(:yellow)
      new_question = gets.chomp
      question.question = new_question
      clear_screen
      logo
      puts "The question has been updated".colorize(:cyan)
      question.save
      return

    elsif change == 3
      clear_screen
      logo
      user = update_user(user)
      puts "What is the new answer?".colorize(:yellow)
      new_answer = gets.chomp
      question.answer = new_answer
      clear_screen
      logo
      puts "The answer has been updated".colorize(:cyan)
      question.save
      return
    elsif change == 4
      clear_screen
      logo
      return
    else
      puts "Please choose a valid option".colorize(:red)
      change = gets.chomp
    end
  else
    clear_screen
    logo
    puts "Please choose a correct id".colorize(:red)
    update_card(user)
  end

end


def delete_card(user)
  clear_screen
  logo
  user = update_user(user)
  questions = user.questions
  # puts "Please choose a question to delete from your deck".colorize(:yellow)
  puts "Type 'exit' to exit".colorize(:red)
  # questions.each{|question| puts "ID: #{question.id}, Question:#{question.question}, Answer: #{question.answer} Topic: #{question.topic}".colorize(:white)}
  all_questions_content = questions.map{|e_query| e_query.question}
  all_questions_content << "exit"
  question_to_delete = prompt.select("Please choose a question to delete from your deck", all_questions_content)

  # q_id = prompt.ask('Which question would you like to delete?')
  clear_screen
  logo
  # while question_to_delete != "exit" #&& questions.count > 0
    if question_to_delete != "exit" #&& (questions.find{|question| question.question == question_to_delete} != nil)

      question = Question.find_by(:question => question_to_delete)

      deck = Deck.find_by(user_id: user.id, question_id: question.id)
      # binding.pry
      Deck.destroy(deck.id) #Change
      clear_screen
      logo
      puts "Question has been deleted"
      # binding.pry
      delete_card(user)

    #  else
    #   # q_id = prompt.ask('Please enter a valid choice?')
    #   puts "What did you do?"
     end
  # end
  clear_screen
  logo
  puts "Question has been deleted"
  return

end







##

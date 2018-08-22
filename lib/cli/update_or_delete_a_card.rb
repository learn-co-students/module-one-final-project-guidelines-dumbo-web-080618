def update_or_delete_a_card(user)
  # puts "What would you like to do?"
  # puts "(1) Update an existing Question"
  # puts "(2) Delete a Question from your deck"
  # puts "(3) Go back to Main Menu"
clear_screen
  if user.questions.empty?
    return puts "You have no questions"
  end

  menu
  choice = nil
  choice = gets.chomp

  until choice == "3"
    if choice == "1"
      update_card(user)
      menu
      choice = gets.chomp
    elsif choice == "2"
      delete_card(user)
      menu
      choice = gets.chomp
    else
      puts "Please pick a valid choice"
      choice = gets.chomp
    end
  end
  clear_screen
end


def menu
  puts "What would you like to do?"
  puts "(1) Update an existing Question"
  puts "(2) Delete a Question from your deck"
  puts "(3) Go back to Main Menu"
end


def update_card(user)
  clear_screen
  user = update_user(user)
  questions = user.questions
  questions.each{|question| puts "ID: #{question.id}, Question:#{question.question}, Answer: #{question.answer}, Topic #{question.topic}"}
  puts "Please choose a question ID you want to update"
  q_id = gets.chomp.to_i

if (questions.find{|question| question.id == q_id.to_i} != nil)
  question = Question.find(q_id.to_i)
  clear_screen
  puts "What would you like to update"
  puts "(1) The Topic: #{question.topic}"
  puts "(2) The Question: #{question.question}"
  puts "(3) The Answer: #{question.answer}"
  puts "(4) Exit"
    change = gets.chomp

    if change == "1"
      clear_screen
      user = update_user(user)
      puts "What is the new topic?"
      new_topic = gets.chomp
      question.topic = new_topic
      clear_screen
      puts "The topic has been updated"
      question.save
      return

    elsif change == "2"
      clear_screen
      user = update_user(user)
      puts "What is the new question?"
      new_question = gets.chomp
      question.question = new_question
      clear_screen
      puts "The question has been updated"
      question.save
      return

    elsif change == "3"
      clear_screen
      user = update_user(user)
      puts "What is the new answer?"
      new_answer = gets.chomp
      question.answer = new_answer
      clear_screen
      puts "The answer has been updated"
      question.save
      return
    elsif change == "4"
      clear_screen
      return
    else
      puts "Please choose a valid option"
      change = gets.chomp
    end
  else
    clear_screen
    puts "Please choose a correct id"
    update_card(user)
  end

end


def delete_card(user)
  clear_screen
  user = update_user(user)
  questions = user.questions
  puts "Please choose a question to delete from your deck"
  puts "Type 'exit' to exit"
  questions.each{|question| puts "ID: #{question.id}, Question:#{question.question}, Answer: #{question.answer} Topic: #{question.topic}"}



  q_id = gets.chomp
  clear_screen
  while q_id != "exit"
    if q_id != "exit" && (questions.find{|question| question.id == q_id.to_i} != nil)

      question = Question.find(q_id.to_i)

      deck = Deck.find_by(user_id: user.id, question_id: question.id)

      Deck.destroy(deck.id)
      clear_screen
      return
     else
       puts "Please enter a valid choice"
       q_id = gets.chomp
     end
  end
  clear_screen

end







##

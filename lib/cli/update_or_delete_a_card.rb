def update_or_delete_a_card(user)
  # puts "What would you like to do?"
  # puts "(1) Update an existing Question"
  # puts "(2) Delete a Question from your deck"
  # puts "(3) Go back to Main Menu"
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
end


def menu
  puts "What would you like to do?"
  puts "(1) Update an existing Question"
  puts "(2) Delete a Question from your deck"
  puts "(3) Go back to Main Menu"
end


def update_card(user)
  questions = user.questions
  questions.each{|question| puts "ID: #{question.id}, Question:#{question.question}, Answer: #{question.answer}, Topic #{question.topic}"}
  puts "Please choose a question ID you want to update"
  q_id = gets.chomp.to_i

  question = Question.find(q_id)

  puts "What would you like to update"
  puts "(1) The Topic: #{question.topic}"
  puts "(2) The Question: #{question.question}"
  puts "(3) The Answer: #{question.answer}"
    change = gets.chomp

    if change == "1"
      puts "What is the new topic?"
      new_topic = gets.chomp
      question.topic = new_topic
      puts "The topic has been updated"
      question.save
      user = update_user
      return

    elsif change == "2"
      puts "What is the new question?"
      new_question = gets.chomp
      question.question = new_question
      puts "The question has been updated"
      question.save
      user = update_user
      return

    elsif change == "3"
      puts "What is the new answer?"
      new_answer = gets.chomp
      question.answer = new_snwer
      puts "The answer has been updated"
      question.save
      user = update_user
      return
    else
      puts "Please choose a valid option"
      change = gets.chomp
    end

end


def delete_card(user)
  user = update_user(user)
  questions = user.questions
  questions.each{|question| puts "ID: #{question.id}, Question:#{question.question}, Answer: #{question.answer}"}
  puts "Please choose a question to delete from your deck"
  q_id = gets.chomp.to_i

  question = Question.find(q_id)

  deck = Deck.find_by(user_id: user.id, question_id: question.id)

  Deck.destroy(deck.id)


end







##

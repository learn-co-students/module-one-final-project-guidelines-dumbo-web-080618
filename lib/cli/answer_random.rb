def make_questions
  Question.all.select{|question| question.universal == true}
end

def check_rand_answer(user, query, your_answer)
  question = query.question
  correct_answer = query.answer
  tries = 1
  until (correct_answer == your_answer || (your_answer == 'x' && tries > 5) || tries > 10)
    clear_screen
    logo
    puts "Incorrect, please try again!".colorize(:red)
    puts "Question: " + question 
    tries += 1
    if tries > 5
      puts "Enter 'x' to exit.".colorize(:red)
    end
    your_answer = gets.chomp
  end
  if tries < 5
    clear_screen
    logo
    user.was_correct
    puts "You are correct, #{user.name}".colorize(:green)
  else
    clear_screen
    logo
    user.answered_question
    puts "The correct answer was '#{correct_answer}'!".colorize(:green)
  end

end

def single_random_question(user, questions)
  random_question_obj = questions.shuffle.first
  rand_question = random_question_obj.question
  your_answer = prompt.ask("The Question is: #{rand_question}")
  check_rand_answer(user, random_question_obj, your_answer)
end

def options
  clear_screen
  logo
  prompt.select("What would you like to do?"){|menu|
    menu.choice 'Answer Single Random Question', 1
    menu.choice 'Exit', 2
  }
end

def answer_random(user)
  clear_screen
  logo
  puts "Universal Questions on General Knowledge".colorize(:cyan)
  universal_quesions = make_questions
  answer = options

  case answer
  when 1
    single_random_question(user, universal_quesions)
  when 2
    clear_screen
    logo
    return
  end
end


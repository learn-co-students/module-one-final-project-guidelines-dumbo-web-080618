def review(user)
  clear_screen
  logo
  if user.questions.empty?
    return puts "You have no questions or decks".colorize(:red)
  end
  # binding.pry
  answer = my_options
  case answer
  when 1
    topic_review(user)
  when 2
    random_review(user)
  when 3
    clear_screen
    logo
    return
  else
    "Invalid Entry".colorize(:red)
    answer = my_options
  end
end

def topic_review(user)
  clear_screen
  logo
  # user = update_user(user)
  topics = user.questions.map{|question| question.topic}.uniq
  my_topic = nil
  until topics.include?(my_topic) do 

  my_topic = prompt.select("What topic would you like to review", topics)
  clear_screen
  logo
  end

  on_topic_questions = user.questions.select{|question| question.topic == my_topic}.shuffle


  number_of_questions = prompt.slider("How many questions would you like to solve", max: (on_topic_questions.size), step: 1 )

  until number_of_questions <= 0
    clear_screen
    logo
    random = on_topic_questions.pop
    rand_quest = random.question
    rand_answer = random.answer

    answer = prompt.ask("The Question is: #{rand_quest}")
    check_answer(user, rand_answer, answer, rand_quest)
    number_of_questions -= 1
  end
end

def random_review(user)
  clear_screen
  logo
  # user = update_user(user)
  puts "Random question:".colorize(:cyan)
  random_questions = user.questions.shuffle

  questions_to_answer = prompt.slider("How many questions would you like to solve", max: (random_questions.size), step: 1 )

  until questions_to_answer <= 0#random_questions.size <= 0
    random = random_questions.pop
    rand_question = random.question
    rand_answer = random.answer
    puts rand_question.colorize(:yellow)
    answer = prompt.ask("What is your answer")
    check_answer(user, rand_answer, answer, rand_question)
    questions_to_answer -= 1
  end
 
end

def my_options
  clear_screen
  logo
 
  prompt.select("What would like to do?") do |menu|
    menu.choice 'Review by Topic', 1
    menu.choice 'Review at Random', 2
    menu.choice 'Exit', 3
  end
end

def check_answer(user, correct_answer, answer, rand_question)

  tries = 1
  until (correct_answer == answer || (answer == 'x' && tries > 5) || tries > 10)
    clear_screen
    logo
    puts "Incorrect, please try again!".colorize(:red)
    puts "Question: " + rand_question
    tries += 1
    if tries > 5
      puts "Enter 'x' to exit.".colorize(:red)
    end
    answer = gets.chomp

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

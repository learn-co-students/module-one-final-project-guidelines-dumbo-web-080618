

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
    puts "Choose a topic to review".colorize(:yellow)
    topics.each{|topic|
    puts "#{topic}"}
    my_topic = gets.chomp
    clear_screen
    logo
  end

  on_topic_questions = user.questions.select{|question| question.topic == my_topic}.shuffle

  until on_topic_questions.size <= 0
    clear_screen
    logo
    random = on_topic_questions.pop
    rand_quest = random.question
    rand_answer = random.answer
    puts "The Question is: #{rand_quest}?".colorize(:yellow)
    answer = gets.chomp
    check_answer(user, rand_answer, answer)
  end
end

def random_review(user)
  clear_screen
  logo
  # user = update_user(user)
  puts "Random question is...".colorize(:cyan)
  random_questions = user.questions.shuffle
  # random =  user.questions.shuffle.pop
  until random_questions.size <= 0
    random = random_questions.pop
    rand_question = random.question
    rand_answer = random.answer
    puts rand_question.colorize(:yellow)
    answer = gets.chomp
    check_answer(user, rand_answer, answer)
  end
  # binding.pry
end

def my_options
  clear_screen
  logo
  puts "Would you like to do ?".colorize(:yellow)
  puts "(1) Review by Topic or".colorize(:cyan)
  puts "(2) Review at Random".colorize(:cyan)
  puts "(3) Exit".colorize(:red)
  answer = gets.chomp.to_i
end

def check_answer(user, correct_answer, answer)

  tries = 1
  until (correct_answer == answer || (answer == 'x' && tries > 5) || tries > 10)
    puts "You are wrong!".colorize(:red)
    tries += 1
    if tries > 5
      puts "Enter 'x' to exit.".colorize(:red)
    end
    answer = gets.chomp

  end
  if tries < 5
    clear_screen
    logo
    puts "You are correct, #{user.name}".colorize(:green)
  else
    puts "The correct answer was '#{correct_answer}'!".colorize(:green)
  end

  # if correct_answer == answer
  #   puts "You are correct, #{user.name}"
  #   right = true
  # else
  #   puts "You are wrong!"
  # end
end

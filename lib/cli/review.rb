def review(user)
  # binding.pry
  answer = my_options
  case answer
  when 1
    topic_review(user)
  when 2
    random_review(user)
  when 3
    "Going back to main menu"
  else
    "Invalid Entry"
    answer = my_options
  end
end


def topic_review(user)
  topics = user.questions.map{|question| question.topic}
  my_topic = nil
  until topics.include?(my_topic) do
    puts "Topics to be reviewed are..."
    topics.each{|topic|
    puts "#{topic}"}
    my_topic = gets.chomp
  end
  on_topic_questions = user.questions.select{|question| question.topic == my_topic}
  # on_topic_questions.map{|e| e.question.question}
  puts "The question is #{on_topic_questions.sample.question}"

end

def random_review(user)
  puts "Random question is..."
  puts user.questions.sample
  binding.pry
end

def my_options
  puts "Would you like to do"
  puts "(1) Review by Topic or"
  puts "(2) Review at Random"
  puts "(3) Exit"
  answer = gets.chomp.to_i
end
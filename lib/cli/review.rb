def review(user)
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

def topic_review(choice)
  puts "Topic to be reviewed is..."
end

def random_review(choice)
  "Random question is..."
end

def my_options
  puts "Would you like to do"
  puts "(1) Review by Topic or"
  puts "(2) Review at Random"
  puts "(3) Exit"
  answer = gets.chomp.to_i
end
require 'pry'
require_relative '../config/environment'

user = login
# x = user.add_a_question("Animals", "What animal eats bugs by pecking wood?", "Wood Pecker")
# binding.pry

answer = main_menu
  case answer
  when 1
    review(user)
  when 2
    make_a_new_card(user)
  when 3
    puts "Answer was #{answer}"
  else
    puts "Invalid answer."
    answer = main_menu
  end
# binding.pry
puts "HELLO WORLD"

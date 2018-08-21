require 'pry'
require_relative '../config/environment'
over = false
user = login
# x = user.add_a_question("Animals", "What animal eats bugs by pecking wood?", "Wood Pecker")
# binding.pry
while !over
  answer = main_menu
  case answer
  when 1
    review(user)
  when 2
    make_a_new_card(user)
  when 3
    update_or_delete_a_card(user)
  when 4
    puts "Goodbye #{user.name}"
    over = true
  else
    puts "Invalid answer."
    answer = main_menu
  end
end


binding.pry
puts "HELLO WORLD"

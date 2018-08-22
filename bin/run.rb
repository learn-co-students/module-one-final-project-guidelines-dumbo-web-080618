require 'pry'
require_relative '../config/environment'
require 'colorize'

clear_screen
over = false
user = login
clear_screen
logo

# x = user.add_a_question("Animals", "What animal eats bugs by pecking wood?", "Wood Pecker")
# binding.pry
while !over
  answer = main_menu(user)
  case answer
  when 1
    review(user)
  when 2
    make_a_new_card(user)
  when 3
    update_or_delete_a_card(user)
  when 4
    puts "Goodbye #{user.name}".colorize(:green)
    over = true
  when 0
    puts "User stats\nName: #{user.name}\nTotal Questions Taken: #{user.total_taken}\nTotal Answered Correctly: #{user.total_correct}\n& #{user.get_percentage}"
  else
    puts "Invalid answer.".colorize(:red)
    answer = main_menu(user)
  end
end

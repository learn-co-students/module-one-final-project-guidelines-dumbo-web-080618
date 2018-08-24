require 'pry'
require 'colorize'
require 'rest-client'
require 'htmlentities'
require 'json'
require_relative '../config/environment'

begin
clear_screen
over = false
user = login
clear_screen
logo

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
    clear_screen
    logo
    puts "Goodbye #{user.name}".colorize(:green)
    over = true
  when 5
    clear_screen
    logo
    puts "\nUser stats\nName: #{user.name}\n#{user.total_correct} out of #{user.total_taken} questions correct!\n#{user.get_percentage}"
  when 6
    answer_random(user)
  when 7
    main_test(user)
  else
    clear_screen
    logo
    puts "Invalid answer.".colorize(:red)
    answer = main_menu(user)
  end
end

rescue
  puts "YOU BROKE THE APP THANKS BUDDY - GO AHEAD AND RESTART -"

end

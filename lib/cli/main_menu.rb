def main_menu(user)
  puts "Welcome #{user.name}! What would like to do".colorize(:yellow)
  puts "(1) Pick a topic to review".colorize(:cyan)
  puts "(2) Make a new card".colorize(:cyan)
  puts "(3) Update or delete a card".colorize(:red)
  puts "(4) Exit"
  answer = gets.chomp.to_i
end

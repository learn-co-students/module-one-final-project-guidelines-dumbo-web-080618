def main_menu(user)
  # puts "Welcome #{user.name}! What would like to do".colorize(:yellow)
  # puts "(1) Pick a topic to review".colorize(:cyan)
  # puts "(2) Make a new card".colorize(:cyan)
  # puts "(3) Update or delete a card".colorize(:cyan)
  # puts "(4) Exit".colorize(:cyan)
  # answer = gets.chomp.to_i


  prompt.select("Welcome #{user.name}! What would like to do?") do |menu|
    menu.choice 'Pick a topic to review', 1
    menu.choice 'Make a new card', 2
    menu.choice 'Update or delete a card', 3
    menu.choice 'User Stats', 5
    menu.choice 'Answer Random Questions', 6
    menu.choice 'Exit', 4

  end
end

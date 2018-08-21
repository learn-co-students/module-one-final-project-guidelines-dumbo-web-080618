def update_or_delete_a_card(user)
  # puts "What would you like to do?"
  # puts "(1) Update an existing Question"
  # puts "(2) Delete a Question from your deck"
  # puts "(3) Go back to Main Menu"
  menu
  choice = nil
  choice = gets.chomp

  until choice == "3"
    if choice == "1"
      update_card(user)
      menu
      choice = gets.chomp
    elsif choice == "2"
      delete_card(user)
      menu
      choice = gets.chomp
    else
      puts "Please pick a valid choice"
      choice = gets.chomp
    end
  end
end


def menu
  puts "What would you like to do?"
  puts "(1) Update an existing Question"
  puts "(2) Delete a Question from your deck"
  puts "(3) Go back to Main Menu"
end


def update_card(user)
  
end
















update_or_delete_a_card("user")

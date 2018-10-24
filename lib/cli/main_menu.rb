def main_menu(user)
  prompt.select("Welcome #{user.name}! What would like to do?") do |menu|
    menu.choice 'Pick a topic to review', 1
    menu.choice 'Make a new card', 2
    menu.choice 'Update or delete a card', 3
    menu.choice 'User Stats', 5
    menu.choice 'Answer Random Questions', 6
    # menu.choice 'Test', 7
    menu.choice 'Exit', 4

  end
end

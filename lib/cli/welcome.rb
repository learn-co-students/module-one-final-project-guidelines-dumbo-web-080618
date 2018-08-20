def welcome
  puts "Welcome to the Learning Zone. What's your name?"
  name = gets.chomp
  user = User.find_or_create_by_name(name)
  puts "Hello #{user.name}, user #{user.id}."
  user
end

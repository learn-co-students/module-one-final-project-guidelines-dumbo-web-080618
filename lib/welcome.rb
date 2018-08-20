
puts "Welcome to the Learning Zone. What's your name?"
name = gets.chomp
login = User.find_or_create_by_name(name)
puts "Hello #{login.name}, user #{login.id}."
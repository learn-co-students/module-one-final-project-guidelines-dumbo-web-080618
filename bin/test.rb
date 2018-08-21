require 'pry'

over = false

def menu
  puts "Menu options are..."
  puts "(1) Do something"
  puts "(3) Edit something"
  puts "(2) Exit"
  answer = gets.chomp.to_i
end

def do_something
  print "Did a random thing #{rand(1..200)} times."
  return
end

def edit_string
  editable = "This is a test."
  print editable
  editable = gets
  puts "Editable text now equals: #{editable}"
end

while !over
  answer = menu
  if answer == 1
    do_something
  elsif answer == 2
    over = true
  elsif answer == 3
    edit_string
  else
    "Invalid Response"
  end
end
require 'pry'

over = false

def menu
  puts "Menu options are..."
  puts "(1) Do something"
  puts "(2) Exit"
  answer = gets.chomp.to_i
end

def do_something
  puts "Did a random thing #{rand(1..200)} times."
  return
end

while !over
  answer = menu
  if answer == 1
    do_something
  elsif answer == 2
    over = true
  end
end
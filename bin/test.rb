require 'pry'
require 'colorize'

over = false
def clear_screen
  system "clear" or system "cls"
end

def menu
  puts "Menu options are...".colorize(:cyan)
  puts "(1) Do something".colorize(:cyan)
  puts "(2) Edit something".colorize(:cyan)
  puts "(3) Color_Test".colorize(:cyan)
  puts "(4) Exit".colorize(:red)
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

def color_test
  String.colors.each{|test_color| puts "#{test_color} =>Testing".colorize(test_color)}
end

while !over
  answer = menu
  if answer == 1
    clear_screen
    do_something
  elsif answer == 4
    over = true
  elsif answer == 2
    clear_screen
    edit_string
  elsif answer == 3
    clear_screen
    color_test
  else
    puts "Invalid Response".colorize(:red)
    clear_screen
    # 
  end
end
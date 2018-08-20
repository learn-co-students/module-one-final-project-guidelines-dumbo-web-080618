require 'pry'
require_relative '../config/environment'

user = welcome
x = user.add_a_question("Animals", "What animal eats bugs by pecking wood?", "Wood Pecker")
binding.pry
puts "HELLO WORLD"

require_relative '../config/environment'


$available_stores = Store.all
$available_shoes = Shoe.all
$available_stock = Stock.all

def self.greeting
  prompt = TTY::Prompt.new
  puts "Hello, welcome to Sole Search!"
  user_input = prompt.select("Would you like to do some Sole Searching today?",%w(Yes No))
  if user_input == "Yes"
    puts "Great! Let's find you some fresh kicks!"
    search
  else
    exit
  end
end

def self.exit
  puts "LATER LOSER!"
end

def self.search
  prompt = TTY::Prompt.new
  user_input = prompt.multi_select("Where would you like to buy your shoes?",%w(Manhattan Brooklyn Bronx Staten\ Island Queens))
  $available_stores = Store.all.select {|store| user_input.include?(store.location)}
  choose_size
end

def self.choose_size
  prompt = TTY::Prompt.new
  user_input = prompt.multi_select("What size shoe would you like?",%w(5 6 7 8 9 10 11 12 13 14 15))
  $available_shoes = Shoe.all.select {|shoe| user_input.include?(shoe.size.to_s)}
  puts $available_shoes
end


greeting

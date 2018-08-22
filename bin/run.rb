require_relative '../config/environment'


$available_stores = Store.all
$available_shoes = Shoe.all
$available_stock = Stock.all

def self.greeting
  prompt = TTY::Prompt.new
  puts "OH SHIT SON! Welcome to Sole Search... Looks like some NYC shops restocked some high heat pairs today so you're in luck..."
  user_input = prompt.select("You tryna do some Sole Searching today or wut?",%w(Yes No))
  if user_input == "Yes"
    puts "That's what I thought my dude. Get ready to cop some serious fire."
    location_search
  else
    exit
  end
end

def exit
  puts "Enjoy those beaters on your feet! LATER LOSER!"
end

def location_search
  prompt = TTY::Prompt.new
  user_input = prompt.multi_select("Are you gonna go the distance to get the perfect pair? Pick as many locations as you want!",%w(Manhattan Brooklyn Bronx Staten\ Island Queens))
  $available_stores = Store.all.select {|store| user_input.include?(store.location)}
  choose_size
end

def choose_size
  prompt = TTY::Prompt.new
  user_input = prompt.multi_select("What size you rock?",%w(7 8 9 10 11 12 13))
  $available_shoes = Shoe.all.select {|shoe| user_input.include?(shoe.size.to_s)}
  user_input = prompt.select("Does price really matter?",%w(Yea\ I'm\ ballin'\ on\ a\ budget Nah\ I'm\ just\ ballin'))
  if user_input == "Yea I'm ballin' on a budget"
    budget
  else
    finder
  end
end

def budget
  prompt = TTY::Prompt.new
  user_input = prompt.select("How much cash you got?",%w(150 200 250 300))
  user_input =user_input.to_i
  $available_stock = $available_stock.select {|stock| stock.price <= user_input}
  puts $available_stock
  # finder
end

def finder
end


greeting

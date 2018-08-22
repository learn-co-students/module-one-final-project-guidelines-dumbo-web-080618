require_relative '../config/environment'


$available_stores = Store.all
$available_shoes = Shoe.all
$available_stock = Stock.all

def greeting
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
  store_id_map = $available_stores.map {|store| store.id}
  $available_stock = $available_stock.select {|stock| store_id_map.include?(stock.store_id)}
  choose_size
end

def choose_size
  prompt = TTY::Prompt.new
  user_input = prompt.multi_select("What size you rock?",%w(7 8 9 10 11 12 13))
  $available_shoes = Shoe.all.select {|shoe| user_input.include?(shoe.size.to_s)}
  shoe_id_map = $available_shoes.map {|shoe| shoe.id}
  $available_stock = $available_stock.select {|stock| shoe_id_map.include?(stock.shoe_id)}
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
  finder
end

def finder
  prompt = TTY::Prompt.new
  user_input = prompt.select("How you wanna find em?",%w(Color Brand Model Style))
  if user_input == "Color"
    color
  elsif user_input == "Brand"
    brand
  elsif user_input == "Model"
    model
  else
    style
  end
end

def color
  prompt = TTY::Prompt.new
  user_input = prompt.select("What color you want your kicks to be?",%w(Black White Red Grey Purple Orange Yellow Blush Green Teal Gold Blue))
  available_shoes = Shoe.all.select do |shoe|
    shoe.color.split("/").include?(user_input)
  end
  shoe_id_map = available_shoes.map {|shoe| shoe.id}
  $available_stock = $available_stock.select {|stock| shoe_id_map.include?(stock.shoe_id)}
end

def brand
  prompt = TTY::Prompt.new
  user_input = prompt.select("What brand?",%w(Nike Converse Adidas))
  available_shoes = Shoe.all.select {|shoe| shoe.brand == user_input}
  shoe_id_map = available_shoes.map {|shoe| shoe.id}
  $available_stock = $available_stock.select {|stock| shoe_id_map.include?(stock.shoe_id)}
end

def model
  prompt = TTY::Prompt.new
  user_input = prompt.select("What model?",%w(Air\ Jordan\ 1 Air\ Jordan\ 3 Air\ Jordan\ 4 Air\ Jordan\ 8 Air\ Jordan\ 14 Converse\ Chuck\ Taylor Yeezy\ Boost\ 350\ V2 Yeezy\ 500 Yeezy\ Boost\ 700 Yeezy\ Powerphase Presto Blazer VaporMax Air\ Max))
  available_shoes = Shoe.all.select {|shoe| shoe.model.include?(user_input)}
  shoe_id_map = available_shoes.map {|shoe| shoe.id}
  $available_stock = $available_stock.select {|stock| shoe_id_map.include?(stock.shoe_id)}
end

def style
  prompt = TTY::Prompt.new
  user_input = prompt.select("What's yo style?",%w(Running Basketball Lifestyle))
  available_shoes = Shoe.all.select {|shoe| shoe.style == user_input}
  shoe_id_map = available_shoes.map {|shoe| shoe.id}
  $available_stock = $available_stock.select {|stock| shoe_id_map.include?(stock.shoe_id)}
  binding.pry
  0
end


greeting

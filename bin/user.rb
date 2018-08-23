def user_greeting
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  puts "Looks like some NYC shops restocked some high heat pairs today so you may be in luck..."
  user_input = prompt.select("Sole Searching takes some serious cash... you for real or you just playin?",%w(I'm\ for\ real I\ want\ out),cycle: true)
  if user_input == "I'm for real"
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
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  user_input = prompt.multi_select("Are you gonna go the distance to get the perfect pair? Pick as many locations as you want!",%w(Manhattan Brooklyn Bronx Staten\ Island Queens),cycle: true)
  available_stores = Store.all.select {|store| user_input.include?(store.location)}
  store_id_map = available_stores.map {|store| store.id}
  $available_stock = $available_stock.select {|stock| store_id_map.include?(stock.store_id)}
  choose_size
end

def choose_size
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  user_input = prompt.multi_select("What size you rock?",%w(7 8 9 10 11 12 13),per_page: 7,cycle:true)
  available_shoes = Shoe.all.select {|shoe| user_input.include?(shoe.size.to_s)}
  shoe_id_map = available_shoes.map {|shoe| shoe.id}
  $available_stock = $available_stock.select {|stock| shoe_id_map.include?(stock.shoe_id)}
  user_input = prompt.select("Does price really matter?",%w(Yea\ I'm\ ballin'\ on\ a\ budget Nah\ I'm\ just\ ballin'),cycle: true)
  if user_input == "Yea I'm ballin' on a budget"
    budget
  else
    finder
  end
end

def budget
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  user_input = prompt.slider("How much cash you got?",min:150,max:300,step:15)
  user_input =user_input.to_i
  $available_stock = $available_stock.select {|stock| stock.price <= user_input}
  finder
end

def finder
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  user_input = prompt.select("How you wanna find em?",%w(Color Brand Model Style),cycle: true)
  if user_input == "Color"
    choose_color
  elsif user_input == "Brand"
    choose_brand
  elsif user_input == "Model"
    choose_model
  else
    choose_style
  end
end

def choose_color
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  user_input = prompt.multi_select("What color you want your kicks to be?",%w(Black White Red Grey Purple Orange Yellow Blush Green Teal Gold Blue), per_page: 12,cycle: true)
  available_shoes = []
  user_input.each do |shoe_color|
    available_shoes.concat(Shoe.all.select {|shoe| shoe.color.include?(shoe_color)})
  end
  available_shoes.uniq!
  shoe_id_map = available_shoes.map {|shoe| shoe.id}
  $available_stock = $available_stock.select {|stock| shoe_id_map.include?(stock.shoe_id)}
  display_message
end

def choose_brand
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  user_input = prompt.multi_select("What brand?",%w(Nike Converse Adidas),cycle: true)
  available_shoes = []
  user_input.each do |shoe_brand|
    available_shoes.concat(Shoe.all.select {|shoe| shoe.brand == shoe_brand})
  end
  shoe_id_map = available_shoes.map {|shoe| shoe.id}
  $available_stock = $available_stock.select {|stock| shoe_id_map.include?(stock.shoe_id)}
  display_message
end

def choose_model
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  user_input = prompt.multi_select("What model?",%w(Air\ Jordan\ 1 Air\ Jordan\ 3 Air\ Jordan\ 4 Air\ Jordan\ 8 Air\ Jordan\ 14 Converse\ Chuck\ Taylor Yeezy\ Boost\ 350\ V2 Yeezy\ 500 Yeezy\ Boost\ 700 Yeezy\ Powerphase Presto Blazer VaporMax Air\ Max),per_page: 15,cycle: true)
  available_shoes = []
  user_input.each do |shoe_model|
    available_shoes.concat(Shoe.all.select {|shoe| shoe.model.include?(shoe_model)})
  end
  shoe_id_map = available_shoes.map {|shoe| shoe.id}
  $available_stock = $available_stock.select {|stock| shoe_id_map.include?(stock.shoe_id)}
  display_message
end

def choose_style
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  user_input = prompt.multi_select("What's yo style?",%w(Running Basketball Lifestyle),cycle: true)
  available_shoes = []
  user_input.each do |shoe_style|
    available_shoes.concat(Shoe.all.select {|shoe| shoe.style == shoe_style})
  end
  shoe_id_map = available_shoes.map {|shoe| shoe.id}
  $available_stock = $available_stock.select {|stock| shoe_id_map.include?(stock.shoe_id)}
  display_message
end

def display_message
  if $available_stock.empty?
    puts "You gotta be less picky if you wanna look fly, famz."
  else
    stores = $available_stock.map {|stock| stock.store}.uniq
    stores.each do |store|
      puts ""
      puts "#{store.name} located in #{store.location} has these soles that match your fly style:"
      puts ""
      $available_stock.each do |stock|
        if stock.store_id == store.id
          puts "...#{stock.shoe.brand} #{stock.shoe.model} in #{stock.shoe.color}, Size #{stock.shoe.size}, $#{stock.price}.  #{stock.quantity} in stock!"
        end
      end
      puts ""
      puts "Store is located at #{store.address}, open #{store.hours}."
      puts "--------------------------------------------------------------------------------------------------------------------"
    end
    goodbye
  end
  #`open https://vignette.wikia.nocookie.net/degrassi/images/b/b0/Success-dance-gif.gif/revision/latest?cb=20160603171727`
end

def goodbye
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  user_input = prompt.select("You find something you like?",%w(Yes No),cycle: true)
  if user_input == "Yes"
    `open https://media1.giphy.com/media/21Ph2K8W6pb6a1D0fc/giphy.gif`
  else
    exit
  end
end

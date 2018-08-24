def retailer_greeting
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  puts ""
  selection = prompt.select("Welcome. Please select one of the below options.",["Existing Sole Search Member", "Join Sole Search"], cycle: true)
  if selection == "Existing Sole Search Member"
    retailer_selection
  else
    create_new_retailer
  end
end

def create_new_retailer
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)

  # uncomment the below lines and move the "name = prompt.ask" line into first line of loop if you want to prevent repeating store names
  name = ""
  loop do
    name = prompt.ask("What is the name of your store?", required: true)
    if Store.all.map {|store| store.name}.include?(name)
      puts "This store already exists. Enter a different name"
    else
      break
    end
  end

  location = prompt.select("In which borough are you located",["Manhattan","Brooklyn","Queens","Staten Island","Bronx"], cycle: true)
  address = prompt.ask("What is your address?",required:true)
  hours = prompt.ask("What are your hours?",required:true)
  specialty = prompt.ask("What type of shoes does your store specialize in?",required:true)
  Store.create(name: name, location: location, address: address, hours: hours, specialty: specialty)

  puts ""
  puts "Welcome to the Sole Search Family!"
  puts "Your super-unique password is: Sneakers123"
  puts "Your password cannot be changed. Please write it down and keep it safe!"
  log_in_option = prompt.select("Would you like to log into your account?",["Yes", "No"])
  if log_in_option == "Yes"
    retailer_selection
  else
    puts "Have a great day!"
  end
end

def retailer_selection
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  all_stores = Store.all.map {|store| store.name}
  $which_store = prompt.select("Select your store.", all_stores, cycle: true)
  password = ""
  loop do
    password = prompt.mask("Please enter your password")
    if password != "Sneakers123"
      puts "Incorrect password. Please try again!"
    else
      break
    end
  end
  retailer_options
end

def retailer_options
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  user_input = prompt.select("What would you like to do today?", ["Add new item", "Update stock","Remove item", "Exit"], cycle:true)
  if user_input == "Add new item"
    add_item
  elsif user_input == "Update stock"
    update_stock
  elsif user_input == "Remove item"
    remove_item
  else
    puts "Thank you for using Sole Search!"
    `open https://media.giphy.com/media/3otPoUkg3hBxQKRJ7y/giphy.gif`
  end
end

def add_item
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  items = Shoe.all.map {|shoe| shoe.item_id}

  item_to_add = ""
  loop do
    item_to_add = prompt.select("Which item would you like to add to your inventory?",items, per_page: 20, cycle: true)
    if Store.find_by(name: $which_store).shoes.map {|shoe| shoe.item_id}.include?(item_to_add)
      puts "Item already exists in your inventory. Please select another item."
    else
      break
    end
  end

  store_id = Store.find_by(name: $which_store).id
  shoe_id = Shoe.find_by(item_id: item_to_add).id
  quantity = prompt.slider("How many pairs of this shoe would you like to add?", min: 1, max: 10, step: 1, convert: :int)
  price = prompt.slider("How much does it cost?", min: 100, max:300, step:5)
  Stock.create(store_id: store_id,shoe_id: shoe_id, quantity: quantity, price: price)

  keep_going = prompt.select("Would you like to do anything else?", ["Yes","No"], cycle: true)
  if keep_going == "Yes"
    retailer_options
  else
    `open https://media0.giphy.com/media/hpfIXBJLNwjrW/giphy.gif`
  end
end

def update_stock
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  store_stock_objects = Store.find_by(name: $which_store).stocks
  if store_stock_objects.empty?
    puts "You have no items in your inventory. Returning to main menu..."
    retailer_options
  else
    store_stock_item_ids = store_stock_objects.map {|stock| stock.shoe.item_id}
    item_to_update = prompt.select("Please select the item by its ID",store_stock_item_ids, cycle: true)
    total_quantity = prompt.slider("What is the total amount you have in stock?", min:1, max: 10, step: 1,convert: :int)
    object_to_update = store_stock_objects.find {|stock| stock.shoe.item_id == item_to_update}

    object_to_update.quantity = total_quantity
    object_to_update.save

    keep_going = prompt.select("Would you like to do anything else?", ["Yes","No"], cycle: true)

    if keep_going == "Yes"
      retailer_options
    else
      `open https://media2.giphy.com/media/l4FBfEwlsy8z1LN8k/giphy.gif`
    end
  end
end

def remove_item
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  store_stock_objects = Store.find_by(name: $which_store).stocks
  if store_stock_objects.empty?
    puts "You have no items in your inventory. Returning to main menu..."
    retailer_options
  else
    store_stock_item_ids = store_stock_objects.map {|stock| stock.shoe.item_id}
    item_to_delete = prompt.select("Please select the item to delete by its ID",store_stock_item_ids, cycle: true)
    object_to_delete = store_stock_objects.find {|instance| instance.shoe.item_id == item_to_delete}
    object_to_delete.destroy

    keep_going = prompt.select("Would you like to do anything else?", ["Yes","No"], cycle: true)

    if keep_going == "Yes"
      retailer_options
    else
      `open https://media0.giphy.com/media/3ohjV4neA9bVFl76tG/giphy.gif`
    end
  end

end

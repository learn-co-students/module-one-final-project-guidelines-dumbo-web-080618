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
  name = prompt.ask("What is the name of your store?")
  location = prompt.select("In which borough are you located",["Manhattan","Brooklyn","Queens","Staten Island","Bronx"], cycle: true)
  address = prompt.ask("What is your address?")
  hours = prompt.ask("What are your hours?")
  specialty = prompt.ask("What type of shoes does your store specialize in?")
  Store.create(name: name, location: location, address: address, hours: hours, specialty: specialty)

  puts ""
  puts "Welcome to the Sole Search Family!"
  puts "Your super-unique password is: Sneakers123"
  puts "Your password cannot be changed. Please write it down and keep it safe!"
  add_stock_option = prompt.select("Would you like to log into your account?",["Yes", "No"])
  if add_stock_option == "Yes"
    retailer_selection
  else
    puts "Have a great day!"
  end
end

def retailer_selection
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  all_stores = Store.all.map {|store| store.name}
  $which_store = prompt.select("Select your store.", all_stores)
  password = prompt.mask("Please enter your password")
  if password == "Sneakers123"
    retailer_options
  else
    puts "Incorrect password. The authorities have been alerted. Goodbye."
  end
end

def retailer_options
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  user_input = prompt.select("What would you like to do today?", ["Add new item", "Update stock","Remove item"], cycle:true)
  if user_input == "Add new item"
    add_item
  elsif user_input == "Update stock"
    update_stock
  else
    remove_item
  end
end

def add_item
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  items = Shoe.all.map {|shoe| shoe.item_id}
  item_to_add = prompt.select("Which item would you like to add to your inventory?",items, per_page: 20, cycle: true)
  store_id = Store.find_by(name: $which_store).id
  shoe_id = Shoe.find_by(item_id: item_to_add).id
  quantity = prompt.slider("How many pairs of this shoe would you like to add?", min: 1, max: 10, step: 1, convert: :int)
  price = prompt.slider("How much does it cost?", min: 100, max:300, step:5)
  Stock.create(store_id: store_id,shoe_id: shoe_id, quantity: quantity, price: price)

  repeat = prompt.select("Would you like to do anything else?", ["Yes","No"], cycle: true)
  if repeat == "Yes"
    retailer_options
  else
    `open https://media0.giphy.com/media/hpfIXBJLNwjrW/giphy.gif`
  end
end

def update_stock
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  store_stock_objects = Store.find_by(name: $which_store).stocks
  if store_stock_objects.empty?
    puts "You have no items in your inventory. Please add some items first."
    puts "Logging off..."
  else
    store_stock_item_ids = store_stock_objects.map {|stock| stock.shoe.item_id}
    item_to_update = prompt.select("Please select the item by its ID",store_stock_item_ids, cycle: true)
    total_quantity = prompt.slider("What is the total amount you have in stock?", min:1, max: 10, step: 1,convert: :int)
    object_to_update = store_stock_objects.find {|instance| instance.shoe.item_id == item_to_update}

    object_to_update.quantity = total_quantity
    object_to_update.save

    if object_to_update.quantity == 0
      object_to_update.destroy
    end

    repeat = prompt.select("Would you like to do anything else?", ["Yes","No"], cycle: true)

    if repeat == "Yes"
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
    puts "You have no items in your inventory. Please add some items first."
    puts "Logging off..."
  else
    store_stock_item_ids = store_stock_objects.map {|stock| stock.shoe.item_id}
    item_to_delete = prompt.select("Please select the item to delete by its ID",store_stock_item_ids, cycle: true)
    object_to_delete = store_stock_objects.find {|instance| instance.shoe.item_id == item_to_delete}
    object_to_delete.destroy

    repeat = prompt.select("Would you like to do anything else?", ["Yes","No"], cycle: true)

    if repeat == "Yes"
      retailer_options
    else
      `open https://media0.giphy.com/media/3ohjV4neA9bVFl76tG/giphy.gif`
    end
  end

end

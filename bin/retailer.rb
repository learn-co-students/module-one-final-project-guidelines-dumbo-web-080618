def retailer_greeting
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  puts ""
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
  user_input = prompt.select("What would you like to do today?", ["Add new item", "Update stock","Remove item"])
  if user_input == "Add new item"
    add_item
  elsif user_input == "Update stock"
    update_stock
  else
    remove_item
  end
end

def add_item

end

def update_stock
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  store_stock_objects = Store.find_by(name: $which_store).stocks
  store_stock_item_ids = store_stock_objects.map {|stock| stock.shoe.item_id}
  item_to_update = prompt.select("Please select the item by its ID",store_stock_item_ids)
  total_quantity = prompt.ask("What is the total amount you have in stock?", convert: :int)
  object_to_update = store_stock_objects.find {|instance| instance.shoe.item_id == item_to_update}

  object_to_update.quantity = total_quantity
  object_to_update.save

  if object_to_update.quantity == 0
    object_to_update.destroy
  end

  repeat = prompt.select("Would you like to do anything else?", ["Yes","No"])

  if repeat == "Yes"
    retailer_options
  else
    `open https://media2.giphy.com/media/l4FBfEwlsy8z1LN8k/giphy.gif`
  end

end

def remove_item
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  store_stock_objects = Store.find_by(name: $which_store).stocks
  store_stock_item_ids = store_stock_objects.map {|stock| stock.shoe.item_id}
  item_to_delete = prompt.select("Please select the item to delete by its ID",store_stock_item_ids)
  object_to_delete = store_stock_objects.find {|instance| instance.shoe.item_id == item_to_delete}
  object_to_delete.destroy

  repeat = prompt.select("Would you like to do anything else?", ["Yes","No"])

  if repeat == "Yes"
    retailer_options
  else
    `open https://media0.giphy.com/media/3ohjV4neA9bVFl76tG/giphy.gif`
  end

end

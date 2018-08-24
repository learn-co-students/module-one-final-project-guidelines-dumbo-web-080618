def admin_validation
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  can_access = false

  while can_access == false
    password = prompt.mask("Please enter the administrative password")
    if password == "Kicks_Rule_Everything_Around_Me___KICKS"
      puts "Welcome, Sneaker God!"
      can_access = true
    else
      puts "Wrong password. Please try again!"
    end
  end

  admin_options
end

def admin_options
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)

  what_to_do = prompt.select("What would you like to do?",["Add Shoe to Database", "Delete Retailer", "Exit"], cycle: true)
  if what_to_do == "Add Shoe to Database"
    create_shoe
  elsif what_to_do == "Delete Retailer"
    delete_retailer
  else
    admin_exit
  end
end

def admin_exit
  puts "Thank you for everything you do for this world!"
  `open https://media.giphy.com/media/NNbmIjdClGwPC/giphy.gif`
end

def create_shoe
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
  puts "Please enter the following information:"
  brand = prompt.ask("Shoe Brand")
  model = prompt.ask("Shoe Model")
  item_id = prompt.ask("Shoe Item ID")
  size = prompt.slider("Shoe Size",min:5,max:18,step:1)
  color = prompt.ask("Shoe Color")
  style = prompt.ask("Shoe Style")
  msrp = prompt.slider("Shoe MSRP", min:100, max: 300, step: 5)
  Shoe.create(brand: brand, model: model, item_id: item_id, size: size, color: color, style: style, msrp: msrp)

  puts "The shoe has been successfully added to the Shoe database!"
  keep_going = prompt.select("Would you like to do anything else?", ["Yes","No"], cycle: true)

  if keep_going == "Yes"
    admin_options
  else
    admin_exit
  end
end

def delete_retailer
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)

  retailers = Store.all.map {|store| store.name}
  selected_retailer = prompt.select("Which retailer would you like to delete?",retailers,cycle:true)
  selected_retailer_id = Store.find_by(name: selected_retailer).id
  Stock.where(store_id: selected_retailer_id).destroy_all
  Store.find_by(name: selected_retailer).destroy
  puts "#{selected_retailer} has been successfully removed as a Sole Search retailer!"

  keep_going = prompt.select("Would you like to do anything else?", ["Yes","No"], cycle: true)

  if keep_going == "Yes"
    admin_options
  else
    admin_exit
  end
end

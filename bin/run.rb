require_relative '../config/environment'
require_relative './user.rb'
require_relative './retailer.rb'
require_relative './admin.rb'
ActiveRecord::Base.logger = nil

def run
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)

  puts "________     ______          ________                        ______"
  puts "__  ___/________  /____      __  ___/__________ ________________  /_"
  puts "_____ \\_  __ \\_  /_  _ \\     _____ \\_  _ \\  __ `/_  ___/  ___/_  __ \\"
  puts "____/ // /_/ /  / /  __/     ____/ //  __/ /_/ /_  /   / /__ _  / / /"
  puts "/____/ \\____//_/  \\___/      /____/ \\___/\\__,_/ /_/    \\___/ /_/ /_/"
  puts ""
  puts "OH SHIT SON! Welcome to Sole Search!"
  puts ""
  user_input = prompt.select("You tryna buy some fresh kicks today?",["Yes", "No I'm a retailer", "Actually I run this site"],cycle: true)
  if user_input == "Yes"
    user_greeting
  elsif user_input == "No I'm a retailer"
    retailer_greeting
  else
    admin_validation
  end
end

run

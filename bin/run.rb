require_relative '../config/environment'
require_relative './user.rb'
require_relative './retailer.rb'
ActiveRecord::Base.logger = nil
$available_stock = Stock.all

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
  user_input = prompt.select("You tryna buy some fresh kicks today?",%w(Yes No\ I'm\ a\ retailer),cycle: true)
  if user_input == "Yes"
    user_greeting
  else
    retailer_greeting
  end
end

run

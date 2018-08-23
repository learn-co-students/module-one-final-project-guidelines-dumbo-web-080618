require_relative '../config/environment'
require_relative './user.rb'
require_relative './retailer.rb'
ActiveRecord::Base.logger = nil
$available_stock = Stock.all

def run
  prompt = TTY::Prompt.new(active_color: :cyan,help_color: :cyan)
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

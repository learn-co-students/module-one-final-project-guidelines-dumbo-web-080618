require_relative '../config/environment'


def greeting
  prompt = TTY::Prompt.new
  puts "Hello, welcome to Sole Search!"
  user_input = prompt.select("Would you like to do some Sole Searching today?",%w(Yes No))
  if user_input == "Yes"
    puts "Great! Let's find you some fresh kicks!"
    search
  else
    exit
  end
end

def exit
  puts "LATER LOSER!"
end

def search
  prompt = TTY::Prompt.new
  user_input = prompt.multi_select("Where would you like to buy your shoes?",%w(Manhattan Brooklyn Bronx Staten\ Island Queens))
end

# def would_you_like_buy
#   ('What is your name?', default: ENV['USER'])
# end

greeting

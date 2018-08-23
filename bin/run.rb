require_relative '../config/environment'
require 'colorize'

def front_page
  temp = nil
  prompt = TTY::Prompt.new
  input = prompt.select("Please choose your command?", %w(LOGIN CREATE_USER EXIT))
  case input
  when "LOGIN"
    temp = login
  when "CREATE_USER"
    temp = create_user
  when "EXIT"
    exit
  else
    puts "Wrong input"
  end
  temp
end


def run
  prompt = TTY::Prompt.new
  system "clear"
  welcome

  user = nil
  while user == nil
    user = front_page
  end
  name = user.full_name

  system "clear"
  welcome
  help
  loop do
    input = prompt.select("Please choose your command?", %w(HELP VIEW CREATE UPDATE REMOVE EXIT CREATE_DOC CREATE_PAT))
    case input
    when "HELP"
      help
    when "VIEW"
      view(name)
    when "CREATE"
      create(name)
    when "UPDATE"
      update(name)
    when "REMOVE"
      remove(name)
    when "CREATE_DOC"
      create_doc
    when "CREATE_PAT"
      create_pat
    when "EXIT"
      exit
    else
      "wrong input"
    end
  end
end

run
binding.pry
0

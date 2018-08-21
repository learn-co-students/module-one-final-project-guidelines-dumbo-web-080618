require_relative '../config/environment'
require_relative '../app/models/appointment.rb'
require_relative '../app/models/doctor.rb'
require_relative '../app/models/patient.rb'

prompt = TTY::Prompt.new

def welcome
  puts "Hello welcome to the App"
  puts "Please enter your full name"
end

def help
  puts "help - will give you choices of available commands"
  puts "*WIP* view - will see all of the current patient appointments"
  puts "create - will create a new patient"
  puts "update - will update an existing patient's appointment"
  puts "*WIP* remove - will remove the existing patient's appointment"
  puts "-----------------------------------------"
end

old_logger = ActiveRecord::Base.logger
#turn off debug
ActiveRecord::Base.logger = nil
#turn on debug
#ActiveRecord::Base.logger = old_logger

welcome
help
# user_input = gets.chomp
# patient = Patient.find_patient(user_input)
# puts patient.full_name

felix = Patient.create(first_name:"felix",last_name:"chan",gender:"f")
otash = Patient.create(first_name:"otash",last_name:"kamalov",gender:"m")

# puts enter a date
# user_input = gets.chomp
# date = Time.parse(user_input)


binding.pry
0

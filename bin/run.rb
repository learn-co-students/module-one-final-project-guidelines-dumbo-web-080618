require_relative '../config/environment'
require_relative '../app/models/appointment.rb'
require_relative '../app/models/doctor.rb'
require_relative '../app/models/patient.rb'

prompt = TTY::Prompt.new

def welcome
  puts "Hello welcome to the App"
  puts "Please enter your full name"
end

old_logger = ActiveRecord::Base.logger
#turn off debug
# ActiveRecord::Base.logger = nil
#turn on debug
ActiveRecord::Base.logger = old_logger

# welcome
# user_input = gets.chomp
# patient = Patient.find_patient(user_input)
# puts patient.full_name

felix = Patient.find_patient("felix chan")
surezud = Doctor.find_doctor("surezud zud")


binding.pry
0

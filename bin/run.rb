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

felix = Patient.create(first_name:"felix",last_name:"chan",gender:"f")
otash = Patient.create(first_name:"otash",last_name:"kamalov",gender:"m")

sherzod = Doctor.create(first_name:"sherzod",last_name:"karimov",gender:"m",specialties:"urologist")
appt1 = Appointment.create(doctor_id:sherzod.id,patient_id:felix.id, date:"08/20/2018 14:00",duration:1,note:"")
appt2 = Appointment.create(doctor_id:sherzod.id,patient_id:otash.id, date:"08/20/2018 15:00",duration:1,note:"")

binding.pry
0

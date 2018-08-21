require_relative '../config/environment'
require_relative '../app/models/appointment.rb'
require_relative '../app/models/doctor.rb'
require_relative '../app/models/patient.rb'

def welcome
  puts "Hello welcome to the App"
  puts "Please enter your full name"
end

def help
  puts "--------------------------------------------------------"
  puts "help - will give you choices of available commands"
  puts "view - will see all of the current patient appointments"
  puts "create - will create a new patient"
  puts "update - will update an existing patient's appointment"
  puts "remove - will remove the existing patient's appointment"
  puts "exit - exit this program"
  puts "--------------------------------------------------------"
end

old_logger = ActiveRecord::Base.logger
#turn off debug
ActiveRecord::Base.logger = nil
#turn on debug
#ActiveRecord::Base.logger = old_logger
# user_input = gets.chomp
# patient = Patient.find_patient(user_input)
# puts patient.full_name

felix = Patient.create(first_name:"felix",last_name:"chan",gender:"f")
otash = Patient.create(first_name:"otash",last_name:"kamalov",gender:"m")
sher = Doctor.create(first_name:"sherzod",last_name:"karimov",gender:"m", specialties:"urologist")
appt = Appointment.create(doctor_id:sher.id,patient_id:felix.id,date: "01/02/2018 03:00")
appt1 = Appointment.create(doctor_id:sher.id,patient_id:felix.id,date: "01/03/2018 05:00")

# puts enter a date
# user_input = gets.chomp
# date = Time.parse(user_input)
def view
  puts "Please enter your full name:"
  user_input1 = gets.chomp
  f_patient = Patient.find_patient(user_input1)
  f_patient.view

end

def create
  puts "Please enter your full name:"
  p_full_name = gets.chomp
  f_patient = Patient.find_patient(p_full_name)
  puts "Please enter doctor's full name:"
  d_full_name = gets.chomp
  f_doctor = Doctor.find_doctor(d_full_name)
  puts "Please enter appointment date:"
  puts "dates are MM/DD/YYYY HH:MM example 01/01/1901 00:00"
  date = Time.parse(gets.chomp)
  f_patient.add_appointment(f_doctor,date)
end

def update
  prompt = TTY::Prompt.new
  begin
    name = prompt.ask('What is your full name?')
    doctor = prompt.ask('Which doctor you want to change an appointment with?')
    puts "dates are MM/DD/YYYY HH:MM example 01/01/0001 00:00"
    old_time = Time.parse(prompt.ask('What appointment do you like to update?', default: ENV['USER']))
    new_time = Time.parse(prompt.ask('What time do you want to update to?'))
    pname = Patient.find_patient(name)
    pdoctor = Doctor.find_doctor(doctor)
    pname.update_appointment(pdoctor, old_time, new_time)
  rescue
    puts "Yep something went wrong in update dunno where..."
    binding.pry
  end
end

def remove
  prompt = TTY::Prompt.new
  begin
    name = prompt.ask('What is your full name?')
    doctor = prompt.ask('Which doctor you want to change an appointment with?')
    puts "dates are MM/DD/YYYY HH:MM example 01/01/0001 00:00"
    time = Time.parse(prompt.ask('What appointment time do you like to remove?', default: ENV['USER']))
    pname = Patient.find_patient(name)
    pdoctor = Doctor.find_doctor(doctor)
    pname.remove_appointment(pdoctor, time)
  rescue
    puts "Yep something went wrong in remove dunno where..."
    binding.pry
  end
end

def run
  prompt = TTY::Prompt.new
  welcome
  help
  #name = prompt.ask('What is your full name?')
  #splited_name = name.split(" ")
  loop do
    input = prompt.select("Choose your choice?", %w(Help View Create Update Remove Exit))
    case input
    when "Help"
      help
    when "View"
      view
    when "Create"
      create
    when "Update"
      update
    when "Remove"
      remove
    when "Exit"
      exit
    else
      "wrong input"
    end
  end
end

run
binding.pry
0

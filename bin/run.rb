require_relative '../config/environment'
require_relative '../app/models/appointment.rb'
require_relative '../app/models/doctor.rb'
require_relative '../app/models/patient.rb'
require 'colorize'
def welcome
  puts "Hello, welcome to the"
  # puts" _____  _  _____ "
  # puts"(___  \\( )/  ___)"
  # puts"  (___ | | ___)  "
  # puts'     /"| ("\     '
  # puts"    ( (| |) )    "
  # puts"     `.!' .'     "
  # puts"      / .'\\      "
  # puts"      \\|/ /      "
  # puts"       /.<       "
  # puts"      (| |)      "
  # puts"       | '       "
  # puts"       `-'       "
puts"  .-.
 (   )  ___
 -| |-'`   '-._,
 -| |-.      .'
  |.') `~~~~`
 (_.|  _____             _     _                 _
  |._)|  _  |___ ___ ___|_|___| |_ _____ ___ ___| |_ ___
  |.')|     | . | . | . | |   |  _|     | -_|   |  _|_ -|
 (_.| |__|__|  _|  _|___|_|_|_|_| |_|_|_|___|_|_|_| |___|
  |._)      |_| |_|
 ('.|
  |._)
  '-'"
  #puts "Please enter your full name"
end

def help
  puts "Please see the commands below:"
  puts "--------------------------------------------------------"
  puts "HELP   - will give you choices of available commands"
  puts "VIEW   - will see all of the current patient appointments"
  puts "CREATE - will create an appointment"
  puts "UPDATE - will update an existing patient's appointment"
  puts "REMOVE - will remove the existing patient's appointment"
  puts "EXIT   - exit this program"
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

# felix = Patient.create(first_name:"felix",last_name:"chan",gender:"f")
#felix = Patient.find_by(first_name:"felix")#,last_name:"chan",gender:"f")
# otash = Patient.create(first_name:"otash",last_name:"kamalov",gender:"m")
#sher = Doctor.create(first_name:"sherzod",last_name:"karimov",gender:"m", specialties:"urologist")
#sher = Doctor.find_by(first_name:"sherzod")
# vidim = Doctor.create(first_name:"vadim",last_name:"avnilov",gender:"bm", specialties:"gynaecologist")
 #appt2 = Appointment.create(doctor_id:sher.id,patient_id:felix.id,date: "02/02/2018 09:00",duration:1)
# appt1 = Appointment.create(doctor_id:vidim.id,patient_id:felix.id,date: "01/03/2018 05:00",duration:1)
#

# puts enter a date
# user_input = gets.chomp
# date = Time.parse(user_input)
def view
  prompt = TTY::Prompt.new
  begin
    user_input1 = prompt.ask("Please enter your full name:")
    f_patient = Patient.find_patient(user_input1)
    f_patient.view
  rescue
    puts "Yep something went wrong in view dunno where..."
    binding.pry
  end
end

def create
  prompt = TTY::Prompt.new
  begin
    p_full_name = prompt.ask("Please enter your full name:")
    f_patient = Patient.find_patient(p_full_name)
    if f_patient == nil
      puts "no patient by this name!!!!!!!"
      return
    end
    doctor = prompt.select("Choose your doctor", map_of_doctors)

    puts "dates are DD/MM/YYYY HH:MM example 01/01/1901 00:00"
    begin
      date = prompt.ask("Please enter appointment date:", convert: :datetime)
      f_patient.add_appointment(doctor, date)
      puts "The appointment has been created!"
    rescue
      puts "bad time yoh!"
      puts "enter better!!!"
    end

  rescue
    puts "Yep something went wrong in create dunno where..."
    binding.pry
  end
end

def map_of_doctors
  list_all_doctors = Doctor.all.map {|e| e.full_name}
  list_all_doctors_obj = Doctor.all.map {|e| e}
  doctor_map = {}
  for i in 0..list_all_doctors.length-1
    doctor_map[list_all_doctors[i]] = list_all_doctors_obj[i]
  end
  doctor_map
end

def map_of_times(name, doctor)
  list_all_name = Appointment.all.select{|e| e.patient_id == name.id and e.doctor_id == doctor.id}
  list_all_time = list_all_name.map {|e| e.date}
  patient_map_time = {}
  for i in 0..list_all_time.length-1
    patient_map_time[list_all_time[i]] = list_all_time[i]
  end
  patient_map_time
end

def update
  prompt = TTY::Prompt.new
  begin
    name = prompt.ask('What is your full name?')
    pname = Patient.find_patient(name)
    if pname == nil
      puts "patient name does not exist"
      return
    end
    # doctor = prompt.ask('Which doctor you want to change an appointment with?')
    pdoctor = prompt.select("Choose your doctor", map_of_doctors)

    begin
      old_time = prompt.select('What appointment do you like to update?', map_of_times(pname, pdoctor))
    rescue
      puts "You have no appointment(s) with #{pdoctor.full_name}"
      return
    end
    puts "dates are DD/MM/YYYY HH:MM example 01/01/0001 00:00"
    begin
      new_time = Time.parse(prompt.ask('Please enter a new date/time:'))
    rescue
      system "clear"
      print "ERROR:".colorize(:color => :white,:background => :red)
      puts " The input you have entered does not complie with the date format".colorize(:color => :red)
      return
    end

    pname.update_appointment(pdoctor, old_time, new_time)
    puts "The appointment has been updated!"
  rescue
    puts "Yep something went wrong in update dunno where..."
    binding.pry
  end
end

def remove
  prompt = TTY::Prompt.new
  begin
    name = prompt.ask('What is your full name?')
    patient = Patient.find_patient(name)
    if patient == nil
      puts "no patient by this name!!!!!!!"
      return
    end
    doctor = prompt.select("Choose your doctor", map_of_doctors)

    # puts "dates are in this DD/MM/YYYY HH:MM example 01/01/1901 00:00"
    time = prompt.select('What appointment do you like to update?', map_of_times(patient, doctor))

    patient.remove_appointment(doctor, time)
    puts "The appointment has been removed!"
  rescue
    puts "Yep something went wrong in remove dunno where..."
    binding.pry
  end
end

def run
  system "clear" or system "cls"
  prompt = TTY::Prompt.new
  system "clear"
  welcome
  help
  #name = prompt.ask('What is your full name?')
  loop do

    input = prompt.select("Please choose your command?", %w(HELP VIEW CREATE UPDATE REMOVE EXIT))
    case input
    when "HELP"
      help
    when "VIEW"
      view
    when "CREATE"
      create
    when "UPDATE"
      update
    when "REMOVE"
      remove
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

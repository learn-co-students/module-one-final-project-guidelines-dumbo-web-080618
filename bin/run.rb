require_relative '../config/environment'
require_relative '../app/models/appointment.rb'
require_relative '../app/models/doctor.rb'
require_relative '../app/models/patient.rb'
require_relative '../app/models/credential.rb'
require 'colorize'
def welcome
  puts "Hello, welcome to the"
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
# otash = Patient.create(first_name:"otash",last_name:"kamalov",gender:"m")
#
# cred1 = Credential.create(username:"otash8888",password:"123password",admin?:false,other_id:otash.id)
# binding.pry
#ActiveRecord::Base.logger = old_logger
# felix = Patient.create(first_name:"felix",last_name:"chan",gender:"f")
#felix = Patient.find_by(first_name:"felix")#,last_name:"chan",gender:"f")
#sher = Doctor.create(first_name:"sherzod",last_name:"karimov",gender:"m", specialties:"urologist")
#sher = Doctor.find_by(first_name:"sherzod")
# vidim = Doctor.create(first_name:"vadim",last_name:"avnilov",gender:"bm", specialties:"gynaecologist")
# appt2 = Appointment.create(doctor_id:sher.id,patient_id:felix.id,date: "02/02/2018 09:00",duration:1)
# appt1 = Appointment.create(doctor_id:vidim.id,patient_id:felix.id,date: "01/03/2018 05:00",duration:1)

def view
  prompt = TTY::Prompt.new
  begin

    user_input1 = prompt.ask("Please enter your full name:")
    begin
      f_patient = Patient.find_patient(user_input1)
      f_patient.view
    rescue
      puts "Given name does not exsist"
      return
    end

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

def create_doc
  prompt = TTY::Prompt.new
  doctor1 = nil
  begin
    name = prompt.ask('What is your full name? (first and last name)')
    splited_name = name.split(" ")
    gender = prompt.ask('What is your gender?')
    special = prompt.ask('What is your specialty?')
    doctor1 = Doctor.create(first_name:splited_name[0],last_name:splited_name[1],gender:gender,specialties:special)

    puts "The doctor has been added!"
  rescue
    puts "Yep something went wrong in create_doc dunno where..."
    binding.pry
  end
  doctor1
end

def create_pat
  prompt = TTY::Prompt.new
  patient1 = nil
  begin
    name = prompt.ask('What is your full name? (first and last name)')
    splited_name = name.split(" ")
    gender = prompt.ask('What is your gender?')
    patient1 = Patient.create(first_name:splited_name[0],last_name:splited_name[1],gender:gender)

    puts "The patient has been added!"
  rescue
    puts "Yep something went wrong in create_pat dunno where..."
    binding.pry
  end
  patient1
end

def front_page
  prompt = TTY::Prompt.new
  input = prompt.select("Please choose your command?", %w(LOGIN CREATE_USER))
  case input
  when "LOGIN"
    login
  when "CREATE_USER"
    create_user
  else
    puts "Wrong input"
  end

end

def login
  prompt = TTY::Prompt.new

  user_name = prompt.ask('Please enter username:')
  user_password = prompt.ask('Please enter password:')

  cred1 = Credential.find_by(username:user_name,password:user_password)
  #cred1.admin?
  if cred1 == nil
    puts "Incorrect username or password"
    return
  end

end

def create_user
  prompt = TTY::Prompt.new
  user = create_pat
  user_name = prompt.ask('Please enter username:')
  user_password = prompt.ask('Please enter password:')

  Credential.create(username:user_name,password:user_password,admin?:false,other_id:user.id)
end

def run
  system "clear" or system "cls"
  prompt = TTY::Prompt.new
  system "clear"
  welcome
  name = front_page
  help

  loop do

    input = prompt.select("Please choose your command?", %w(HELP VIEW CREATE UPDATE REMOVE EXIT CREATE_DOC CREATE_PAT))
    case input
    when "HELP"
      help(name)
    when "VIEW"
      view
    when "CREATE"
      create
    when "UPDATE"
      update
    when "REMOVE"
      remove
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

require_relative '../../config/environment'
require 'colorize'

def map_of_doctors
  list_all_doctors = Doctor.all.map {|e| e.full_name}
  list_all_doctors_obj = Doctor.all.map {|e| e}
  doctor_map = {}
  for i in 0..list_all_doctors.length-1
    doctor_map[list_all_doctors[i]] = list_all_doctors_obj[i]
  end
  if !doctor_map.empty?
    doctor_map["Return to main menu"] = "EXIT"
  end
  doctor_map
end

def map_of_times(name, doctor)
  list_all_name = Appointment.all.select{|e| e.patient_id == name.id and e.doctor_id == doctor.id}
  list_all_time = list_all_name.map {|e| e.date.localtime}
  patient_map_time = {}
  for i in 0..list_all_time.length-1
    patient_map_time[list_all_time[i]] = list_all_time[i]
  end
  if !patient_map_time.empty?
    patient_map_time["Return to main menu"] = "EXIT"
  end
  patient_map_time
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
    puts "The patient has been added!".colorize(:color => :green)
  rescue
    puts "Yep something went wrong in create_pat dunno where..."
    binding.pry
  end
  patient1
end

def create_user
  prompt = TTY::Prompt.new
  user = nil
  loop do
    puts "Input quit to exit"
    user_name = prompt.ask('Please enter username:')
    if user_name == "quit"
      puts "returning to login screen"
      return
    end
    if !Credential.find_by(username:user_name)
      user_password1 = prompt.mask('Please enter password:')
      user_password2 = prompt.mask('Please enter password again:')
      if user_password1 == user_password2
        user = create_pat
        Credential.create(username:user_name,password:user_password1,admin?:false,other_id:user.id)
        break
      else
        system "clear"
        welcome
        print "ERROR:".colorize(:color => :white,:background => :red)
        puts " Password did not match".colorize(:color => :red)
      end
    else
      system "clear"
      welcome
      print "ERROR:".colorize(:color => :white,:background => :red)
      puts " Username have been taken".colorize(:color => :red)
    end
  end
  Patient.find_by(id:user.id)
end

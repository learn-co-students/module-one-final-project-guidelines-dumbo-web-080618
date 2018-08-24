require_relative '../../config/environment'
require 'colorize'
def welcome
  system 'clear'
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

  welcome
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

def view(name)
  prompt = TTY::Prompt.new
  begin
    f_patient = Patient.find_patient(name)
    f_patient.view
  rescue

    welcome
    print "ERROR:".colorize(:color => :white,:background => :red)
    puts " Username have been taken".colorize(:color => :red)
    return
  end
end

def create(name)
  prompt = TTY::Prompt.new
  loop do
    begin
      f_patient = Patient.find_patient(name)
      doctor = prompt.select("Choose your doctor", map_of_doctors)
      if doctor == "EXIT"
        welcome
        return
      end
      puts "dates are DD/MM/YYYY HH:MM example 01/01/1901 00:00"
      puts "input 'quit' to go back to main menu"
      begin
        input = prompt.ask("Please enter appointment date:")
        if input == "quit"
          return
        end
        date = Time.parse(input)
        a = f_patient.add_appointment(doctor, date)
        if a == nil
          next
        else
          return
        end
      rescue

        welcome
        print "ERROR:".colorize(:color => :white,:background => :red)
        puts " Time have been taken or you have not enter the correct date format".colorize(:color => :red)
      end
    rescue
      puts "Yep something went wrong in create dunno where..."
      binding.pry
    end
  end

  welcome
  puts "The appointment has been created".colorize(:color => :green)
end

def update(name)
  prompt = TTY::Prompt.new
  begin
    pname = Patient.find_patient(name)
    loop do

    pdoctor = prompt.select("Choose your doctor", map_of_doctors)
    if pdoctor == "EXIT"
      welcome
      return
    end
    begin
      old_time = prompt.select('What appointment do you like to update?', map_of_times(pname, pdoctor))

      if old_time == "EXIT"

        welcome
        return
      end
    rescue

      welcome
      print "ERROR:".colorize(:color => :white,:background => :red)
      puts " You have no appointment(s) with #{pdoctor.full_name}".colorize(:color => :red)
      next
    end
    puts "dates are DD/MM/YYYY HH:MM example 01/01/1901 00:00"
    begin
      new_time = Time.parse(prompt.ask('Please enter a new date/time:'))
    rescue

      welcome
      print "ERROR:".colorize(:color => :white,:background => :red)
      puts " The input you have entered does not complie with the date format".colorize(:color => :red)
      next #return
    end
      if new_time != nil

        u = pname.update_appointment(pdoctor, old_time, new_time)
        if u == nil
          next
        end
        break
      end

    end
    # system "clear"
    # welcome
    # puts "The appointment has been updated!".colorize(:color => :green)
  rescue
    puts "Yep something went wrong in update dunno where..."
    binding.pry
  end
end

def remove(name)
  prompt = TTY::Prompt.new
  begin
    patient = Patient.find_patient(name)
    doctor = nil
    time = nil
    loop do
      doctor = prompt.select("Choose your doctor", map_of_doctors)
      if doctor == "EXIT"
        welcome
        return
      end
      begin
        time = prompt.select('What appointment do you like to update?', map_of_times(patient, doctor))
        if time == "EXIT"

          welcome
          return
        end
        break
      rescue

        welcome
        print "ERROR:".colorize(:color => :white,:background => :red)
        puts " No appointments with #{doctor.full_name}".colorize(:color => :red)
      end
    end
    patient.remove_appointment(doctor, time)

    welcome
    puts "The appointment has been removed!".colorize(:color => :green)
  rescue
    puts "Yep something went wrong in remove, dunno where..."
    binding.pry
  end
end

def login
  prompt = TTY::Prompt.new

  user_name = prompt.ask('Please enter username:')
  if user_name == nil or user_name == ""
    welcome
    print "ERROR:".colorize(:color => :white,:background => :red)
    puts " No username entered".colorize(:color => :red)
    return
  else
    user_password = prompt.mask('Please enter password:')
  end

  begin
    cred1 = Credential.find_by(username:user_name.downcase.strip,password:user_password)
    Patient.find_by(id:cred1.other_id)
  rescue

    welcome
    print "ERROR:".colorize(:color => :white,:background => :red)
    puts " Incorrect username or password".colorize(:color => :red)
    return
  end
end

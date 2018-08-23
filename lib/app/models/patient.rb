class Patient < ActiveRecord::Base
    has_many :appointments
    has_many :doctors, through: :appointments
    has_one :credential
    def full_name
      [self.first_name, self.last_name].join(" ")
    end

    def self.find_patient(name)
      #it requires first name and last name
      splited_name = name.split(" ")
      self.find_by(first_name:splited_name[0], last_name:splited_name[1])
    end

    def doctor_date_avaiable?(doctor, date, duration)
      array_appt = Appointment.all.select {|appt| appt.doctor_id == doctor.id}
      array_appt.each do |appt|
        if date.to_i >= (appt.date).to_i and date.to_i <= (appt.date).to_i + duration.hours
          return false
        end
      end
      true
    end
    #date is already a timed parsed
    def add_appointment(doctor, date, duration = 1.0, note = "")
      if doctor_date_avaiable?(doctor, date, duration)
        a = Appointment.create(doctor_id: doctor.id, patient_id: self.id, date: date, note: note, duration: duration)
        system "clear"
        welcome
        puts "The appointment has been created!".colorize(:color => :green)
        a
      else
        system "clear"
        welcome
        puts "Doctor is unavaiable at this time!".colorize(:color => :yellow)
      end
    end

    def update_appointment(doctor, old_date, new_date, duration = 1.0, note = "")
      if doctor_date_avaiable?(doctor, new_date, duration)
        temp = Appointment.find_by(doctor_id: doctor.id, patient_id: self.id, date: old_date)
        temp.update(date: new_date)
        system "clear"
        welcome
        puts "Time has been updated!".colorize(:color => :green)
      else
        system "clear"
        welcome
        puts "Doctor is unavaiable at this time!".colorize(:color => :yellow)
      end
    end


    def view
      system "clear"
     list_appts = Appointment.all.select do |appt_obj|
        appt_obj.patient_id == self.id
      end
      if list_appts == []
        system "clear"
        welcome
        puts "You don't have any appointments".colorize(:color => :yellow)
      else
        system "clear"
        welcome
        list_appts.each do |appt_obj|
          id1 = appt_obj.doctor_id
          f_doc = Doctor.find_by(id:id1)
          puts "-------------------------------------------"
          puts "Doctor name: #{f_doc.full_name}"
          puts "appointment date: #{appt_obj.date.localtime}"
          puts "-------------------------------------------"
        end
      end
    end


    def remove_appointment(doctor, date)
      temp = Appointment.find_by(doctor_id: doctor.id, patient_id: self.id, date: date)
      if temp != nil
        temp.destroy
      else
        system "clear"
        welcome
        print "ERROR:".colorize(:color => :white,:background => :red)
        puts " There is no doctor available".colorize(:color => :red)
      end
    end

end

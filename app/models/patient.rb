class Patient < ActiveRecord::Base
    has_many :appointments
    has_many :doctors, through: :appointments

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
        # if date > "17:00" and date < "09:00"
        #   return false
        # end
      end
      true
    end
    #date is already a timed parsed
    def add_appointment(doctor, date, duration = 1.0, note = "")
      if doctor_date_avaiable?(doctor, date, duration)
        Appointment.create(doctor_id: doctor.id, patient_id: self.id, date: date, note: note, duration: duration)
      else
        puts "Doctor is unavaiable at this time!"
      end
    end

    def update_appointment(doctor, old_date, new_date, duration = 1.0, note = "")
      if doctor_date_avaiable?(doctor, new_date, duration)
        temp = Appointment.find_by(doctor_id: doctor.id, patient_id: self.id, date: old_date)
        temp.update(date: new_date.to_i)
      else
        puts "Doctor is unavaiable at this time!"
      end
    end

end

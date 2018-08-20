class Patient < ActiveRecord::Base
    has_many :appointments
    has_many :doctors, through: :appointments

    def full_name
      [self.first_name, self.last_name].join(" ")
    end

end

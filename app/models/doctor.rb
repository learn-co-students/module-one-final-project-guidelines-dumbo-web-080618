class Doctor < ActiveRecord::Base
  has_many :appointments
  has_many :patients, through: :appointments

  def full_name
    [self.first_name, self.last_name].join(" ")
  end
end

class Doctor < ActiveRecord::Base
  has_many :appointments
  has_many :patients, through: :appointments
  has_one :credential
  
  def full_name
    [self.first_name, self.last_name].join(" ")
  end

  def self.find_doctor(name)
    #it requires first name and last name
    splited_name = name.split(" ")
    self.find_by(first_name:splited_name[0], last_name:splited_name[1])
  end

end

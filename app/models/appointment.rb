class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient

  def method_name

  end

end

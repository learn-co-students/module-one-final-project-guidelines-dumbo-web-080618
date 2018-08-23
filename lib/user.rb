class User < ActiveRecord::Base
<<<<<<< HEAD
  validates_with EmailAddress::ActiveRecordValidator, field: :email
  has_many :saved_activities
  has_many :activities, through: :saved_activities
=======
  has_many :user_selections
  has_many :activities, through: :user_selections
>>>>>>> d2d79fdc3c39b20e0e8ad27b0aca91d9cc19fac2
end

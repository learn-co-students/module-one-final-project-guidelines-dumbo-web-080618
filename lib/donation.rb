class Donation < ActiveRecord::Base
  belongs_to :legislator
  belongs_to :user
end

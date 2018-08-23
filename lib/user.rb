class User < ActiveRecord::Base
  has_many :donations
  has_many :legislators, through: :donations

  def donate(legislator_id, amount)
    legislator = Legislator.find(legislator_id)
    Donation.create(user_id: self.id, representative_id: legislator.id, amount: amount)
  end
  
end


#how do I access individual user instances to preform actions on that user?

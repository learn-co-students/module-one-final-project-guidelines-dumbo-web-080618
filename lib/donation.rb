class Donation < ActiveRecord::Base
  has_many :users
  attr_reader :user_id, :representative_id, :amount

  def initialize(user_id, representative_id, amount)
    @user_id = user_id
    @representative_id = representative_id
    @amount = amount
  end


end

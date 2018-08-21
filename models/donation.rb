class Donation < ActiveRecord::Base
  has_many :users
  attr_reader :user_id, :representative_id

  def initialize(user_id, representative_id)
    @user_id = user_id
    @representative_id = representative_id
  end


end
